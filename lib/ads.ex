defmodule GRPC.XDS.ADS do
  def get_service_resource(service) do
    {:ok, channel} = Application.get_env(:grpc_xds, :control_plane_address) |> GRPC.Stub.connect()
    get_resources(channel, [service])
  end

  def get_resources(channel, resources) do
    stream = GRPC.XDS.ADS.Stub.stream_aggregated_resources(channel, timeout: 30_000)
    req = discovery_request(resources)
    stream_pid = spawn(fn -> GRPC.Stub.send_request(stream, req, end_stream: false) end)
    response = wait_response(stream)
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

  def discovery_request(resources) do
    %Envoy.Service.Discovery.V3.DiscoveryRequest{
      type_url: "type.googleapis.com/envoy.config.listener.v3.Listener",
      response_nonce: "1",
      resource_names: resources,
      node: xds_node
    }
  end

  def xds_node() do
    %Envoy.Config.Core.V3.Node{
      id: Application.get_env(:grpc_xds, :project_id),
      cluster: "cluster",
      metadata: nil,
      user_agent_name: "elixir-grpc",
      # {:user_agent_version, "1.0"},
      user_agent_version_type: nil,
      dynamic_parameters: %{},
      extensions: [],
      client_features: ["envoy.lb.does_not_support_overprovisioning"],
      listening_addresses: []
    }
  end

  def xds_node_metadata() do
    %Google.Protobuf.Struct{
      fields: %{
        "TRAFFICDIRECTOR_GCP_PROJECT_NUMBER" => %Google.Protobuf.Value{
          kind: {:string_value, "150432616675"}
        },
        "TRAFFICDIRECTOR_NETWORK_NAME" => %Google.Protobuf.Value{
          kind: {:string_value, "xpn-network"}
        }
      }
    }
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
