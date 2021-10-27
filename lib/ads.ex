defmodule GRPC.XDS.ADS do
  def get_service_resource(service) do
    {:ok, channel} = Application.get_env(:grpc_xds, :control_plane_address) |> GRPC.Stub.connect()

    channel
    |> get_resources(:listener, [service])
  end

  def get_resources(channel, type, resources) do
    stream = GRPC.XDS.ADS.Stub.stream_aggregated_resources(channel, timeout: 30_000)
    req = discovery_request(type, resources)
    spawn(fn -> GRPC.Stub.send_request(stream, req, end_stream: false) end)
    {:ok, response} = wait_response(stream)
    GRPC.Stub.end_stream(stream)
    response
  end

  def wait_response(stream) do
    {:ok, reply_enum} = GRPC.Stub.recv(stream)

    Enum.find(reply_enum, fn
      {:ok, reply} -> reply != [] && reply != nil
      _ -> false
    end)
  end

  def discovery_request(type, resources) do
    %Envoy.Service.Discovery.V3.DiscoveryRequest{
      type_url: type_to_url(type),
      response_nonce: "1",
      resource_names: resources,
      node: xds_node()
    }
  end

  def xds_node() do
    %Envoy.Config.Core.V3.Node{
      id: Application.get_env(:grpc_xds, :project_id),
      cluster: Application.get_env(:grpc_xds, :node_cluster),
      metadata: xds_node_metadata(),
      user_agent_name: Application.get_env(:grpc_xds, :user_agent_name),
      user_agent_version_type: Application.get_env(:grpc_xds, :user_agent_version_type),
      dynamic_parameters: %{},
      extensions: [],
      client_features: ["envoy.lb.does_not_support_overprovisioning"],
      listening_addresses: []
    }
  end

  defp type_to_url(:listener),
    do: google_prefix() <> "envoy.config.listener.v3.Listener"

  defp type_to_url(:route_configuration),
    do: google_prefix() <> "envoy.config.route.v3.RouteConfiguration"

  defp type_to_url(:scoped_route_configuration),
    do: google_prefix() <> "envoy.config.route.v3.ScopeRouteConfiguration"

  defp type_to_url(:virtual_host),
    do: "envoy.config.route.v3.VirtualHost"

  defp type_to_url(:cluster),
    do: google_prefix() <> "envoy.config.cluster.v3.Cluster"

  defp type_to_url(:cluster_load_assignment),
    do: google_prefix() <> "envoy.config.endpoint.v3.ClusterLoadAssignment"

  defp type_to_url(_), do: {:error, :unsupported_type}

  defp google_prefix(), do: "type.googleapis.com/"

  defp xds_node_metadata() do
    %Google.Protobuf.Struct{
      fields: to_protobuf_struct(Application.get_env(:grpc_xds, :node_metadata))
    }
  end

  defp to_protobuf_struct(map) do
    map
    |> Enum.map(fn {k, value} -> {k, to_protobuf_type(value)} end)
    |> Map.new()
  end

  defp to_protobuf_type(value) do
    typed_value =
      cond do
        is_nil(value) -> {:null_value, value}
        is_number(value) -> {:number_value, value}
        is_binary(value) -> {:string_value, value}
        is_boolean(value) -> {:bool_value, value}
        is_map(value) -> {:struct_value, to_protobuf_struct(value)}
        is_list(value) -> {:list_value, Enum.map(value, &to_protobuf_type/1)}
        true -> {:error, :unsupported_value_type}
      end

    %Google.Protobuf.Value{kind: typed_value}
  end
end

defmodule GRPC.XDS.ADS.Service do
  use GRPC.Service, name: "envoy.service.discovery.v3.AggregatedDiscoveryService"

  rpc(
    :StreamAggregatedResources,
    stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
    stream(Envoy.Service.Discovery.V3.DiscoveryResponse)
  )
end

defmodule GRPC.XDS.ADS.Stub do
  use GRPC.Stub, service: GRPC.XDS.ADS.Service
end
