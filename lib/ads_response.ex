defmodule GRPC.XDS.ADS.Response do
  def parse_response(response) do
    response |> Map.get(:resources) |> Enum.map(&parse_resource/1) |> Map.new()
  end

  def route_conf_name_from_listener_resources(resource) do
    {_, api_listener} =
      resource
      |> Map.get(:api_listener)
      |> Map.get(:api_listener)
      |> parse_resource()

    {:rds, rds} = Map.get(api_listener, :route_specifier)
    Map.get(rds, :route_config_name)
  end

  defp parse_resource(resource) do
    type_url = resource |> Map.get(:type_url)
    type_module = GRPC.XDS.ADS.TypeMap.type_url_to_proto_module(type_url)
    parsed_resource = apply(type_module, :decode, [Map.get(resource, :value)])
    type = GRPC.XDS.ADS.TypeMap.type_url_to_type_atom(type_url)
    {{type, resource_name(type, parsed_resource)}, parsed_resource}
  end

  defp resource_name(:cluster_load_assignment, parsed_resource),
    do: Map.get(parsed_resource, :cluster_name)

  defp resource_name(_type, parsed_resource), do: Map.get(parsed_resource, :name)
end
