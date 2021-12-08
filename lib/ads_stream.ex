defmodule GRPC.XDS.ADS.Stream do
  use GenServer
  defstruct [:channel, :stream, :response, :resources, :version]

  def init(channel) do
    # start the stream
    # TODO: make timeout configurable
    stream = GRPC.XDS.ADS.Stub.stream_aggregated_resources(channel, timeout: 30_000)
    {:ok, %__MODULE__{channel: channel, stream: stream}}
  end

  def handle_call({:get_resource, resource_name, type}, _from, state) do
    {:reply, :ok, state |> Map.get(:resources, %{}) |> Map.get({type, resource_name})}
  end

  def handle_call({:send_discovery_request, type, resources}, _from, state) do
    stream = Map.get(state, :stream)
    req = GRPC.XDS.ADS.Request.discovery_request(type, resources, Map.get(state, :version))
    GRPC.Stub.send_request(stream, req, end_stream: false)
    {:ok, response} = wait_for_response(stream)
    {:reply, {:ok, response}, update_state_from_response(state, response)}
  end

  def handle_cast(:end_stream, state) do
    GRPC.Stub.end_stream(Map.get(state, :stream))
    {:stop, :normal, nil}
  end

  def terminate(_reason, state), do: GRPC.Stub.end_stream(Map.get(state, :stream))

  ## private

  defp wait_for_response(stream) do
    {:ok, reply_enum} = GRPC.Stub.recv(stream)

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

    updated_resources =
      state
      |> Map.get(:resources)
      |> Map.merge(resources_from_response)

    Map.put(state, :resources, updated_resources)
  end

  defp update_version_from_response(state, response) do
    Map.put(state, :version, Map.get(response, :version_info))
  end
end
