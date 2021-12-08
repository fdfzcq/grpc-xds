defmodule GRPC.XDS.ADS.Request do
  def discovery_request(type, resources, version) do
    %Envoy.Service.Discovery.V3.DiscoveryRequest{
      type_url: type_to_url(type),
      response_nonce: "1",
      resource_names: resources,
      node: xds_node(),
      version_info: version
    }
  end

  defp xds_node() do
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

  defp type_to_url(type_atom),
    do: GRPC.XDS.ADS.TypeMap.type_atom_to_type_url(type_atom)

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
