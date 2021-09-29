defmodule GRPC.XDS.EDS do
  def register(), do: :ok

  def do_something(channel) do
    discovery_request = :to_be_added
    {:ok, reply} = GRPC.XDS.EDS.Stub.stream_endpoints(channel, discovery_request)
    IO.inspect(reply)
  end
end

defmodule GRPC.XDS.EDS.Service do
  use GRPC.Service, name: "envoy.service.endpoint.v3.EndpointDiscoveryService"

  rpc(
    :StreamEndpoints,
    Envoy.Service.Discovery.V3.DiscoveryRequest,
    Envoy.Service.Discovery.V3.DiscoveryResponse
  )

  # TODO add delta API
end

defmodule GRPC.XDS.EDS.Stub do
  use GRPC.Stub, service: GRPC.XDS.EDS.Service
end
