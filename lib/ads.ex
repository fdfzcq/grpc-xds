defmodule GRPC.XDS.ADS do
  def get_service_resource(service) do
    case Application.get_env(:grpc_xds, :control_plane_address) do
      nil -> {:error, :no_control_plane_address_set}
      address -> get_service_resource(address, service)
    end
  end

  def get_service_resource(control_plane_address, service) do
    {:ok, channel} = GRPC.Stub.connect(control_plane_address)
    get_resources(channel, :listener, [service])
  end

  def get_resources(channel, type, resources) do
    {:ok, pid} = GenServer.start_link(GRPC.XDS.ADS.Stream, channel)
    {:ok, response} = GenServer.call(pid, {:send_discovery_request, type, resources})
    response
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
