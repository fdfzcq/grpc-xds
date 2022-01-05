defmodule GRPC.XDS.ADS.Stream do
  use GenServer
  defstruct [:channel, :stream, :response, :resources, :version]

  def init(channel) do
    {:ok, %__MODULE__{channel: channel, resources: %{}}}
  end

  def handle_info(info), do: IO.inspect(info)

  def handle_call({:get_resource, resource_name, type}, _from, state) do
    {:reply, :ok, state |> Map.get(:resources, %{}) |> Map.get({type, resource_name})}
  end

  def handle_call({:send_discovery_request, resources}, _from, state) do
    new_state =
      state
      |> listener_resources(resources)
      |> route_configuration_resources(resources)
      # |> cluster_resources(resources)
      |> cluster_load_assignment_resouces(resources)

    addresses = extract_addresses(new_state, resources)

    {:reply, {:ok, addresses}, new_state}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end

  # to be moved

  # 60 minutes timeout
  defp new_stream(channel),
    do: GRPC.XDS.ADS.Stub.stream_aggregated_resources(channel, timeout: 600 * 1000)

  defp listener_resources(state, resources) do
    stream = new_stream(Map.get(state, :channel))
    req = GRPC.XDS.ADS.Request.discovery_request(:listener, resources, Map.get(state, :version))
    GRPC.Stub.send_request(stream, req)
    {:ok, response} = wait_for_response(stream)
    GRPC.Stub.end_stream(stream)
    update_state_from_response(state, response)
  end

  defp route_configuration_resources(state, resources) do
    stream = new_stream(Map.get(state, :channel))

    route_configuration_names =
      resources
      |> Enum.map(fn r -> route_conf_from_listener_resources(state, r) end)
      |> Map.new()

    req =
      GRPC.XDS.ADS.Request.discovery_request(
        :route_configuration,
        Map.values(route_configuration_names),
        nil
      )

    GRPC.Stub.send_request(stream, req)
    {:ok, response} = wait_for_response(stream)
    GRPC.Stub.end_stream(stream)
    update_state_from_response(state, response)
  end

  defp route_conf_from_listener_resources(state, resource_name) do
    route_conf =
      state
      |> Map.get(:resources)
      |> Map.get({:listener, resource_name})
      |> GRPC.XDS.ADS.Response.route_conf_name_from_listener_resources()

    {resource_name, route_conf}
  end

  defp cluster_load_assignment_resouces(state, resources) do
    stream = new_stream(Map.get(state, :channel))
    clusters_by_resources = clusters_by_resources(state, resources)

    req =
      GRPC.XDS.ADS.Request.discovery_request(
        :cluster_load_assignment,
        Map.values(clusters_by_resources),
        nil
      )

    GRPC.Stub.send_request(stream, req)
    {:ok, response} = wait_for_response(stream)
    GRPC.Stub.end_stream(stream)
    update_state_from_response(state, response)
  end

  defp clusters_by_resources(state, resources),
    do: Enum.map(resources, &clusters_by_resource(&1, state)) |> Map.new()

  defp clusters_by_resource(resource, state) do
    {_, route_conf} = route_conf_from_listener_resources(state, resource)

    {:route, route} =
      Map.get(state, :resources)
      |> Map.get({:route_configuration, route_conf})
      |> Map.get(:virtual_hosts, [%{}])
      |> hd()
      |> Map.get(:routes)
      |> hd()
      |> Map.get(:action)

    {:cluster, cluster} = Map.get(route, :cluster_specifier)
    {resource, cluster}
  end

  defp extract_addresses(state, resources),
    do: Enum.map(resources, &extract_addresses_for_resource(&1, state)) |> List.flatten()

  defp extract_addresses_for_resource(resource, state) do
    {_, cluster} = clusters_by_resource(resource, state)

    Map.get(state, :resources)
    |> Map.get({:cluster_load_assignment, cluster})
    |> Map.get(:endpoints)
    |> Enum.max_by(fn e -> Map.get(e, :load_balancing_weight) |> Map.get(:value) end)
    |> Map.get(:lb_endpoints)
    |> Enum.map(fn lb_endpoint ->
      {:endpoint, endpoint} = Map.get(lb_endpoint, :host_identifier)
      {:socket_address, socket_address} = Map.get(endpoint, :address) |> Map.get(:address)
      host = Map.get(socket_address, :address)
      {:port_value, port} = Map.get(socket_address, :port_specifier)
      {host, port}
    end)
  end

  ## private

  defp wait_for_response(stream) do
    res = GRPC.Stub.recv(stream)

    case res do
      {:error, err} ->
        IO.inspect(Map.get(err, :message), limit: :infinity)
        IO.inspect(GRPC.Stub.recv(stream))

      _ ->
        :ok
    end

    {:ok, reply_enum} = res

    Enum.find(reply_enum, fn
      {:ok, reply} -> reply != [] && reply != nil
      _ -> false
    end)
  end

  defp update_state_from_response(state, response) do
    state
    |> update_version_from_response(response)
    |> update_resources_from_response(response)
  end

  defp update_resources_from_response(state, response) do
    resources_from_response =
      response
      |> GRPC.XDS.ADS.Response.parse_response()

    updated_typed_resources =
      state
      |> Map.get(:resources)
      |> Map.merge(resources_from_response)

    Map.put(state, :resources, updated_typed_resources)
  end

  defp update_version_from_response(state, response) do
    Map.put(state, :version, Map.get(response, :version_info))
  end
end
