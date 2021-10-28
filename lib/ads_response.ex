defmodule GRPC.XDS.ADS.Response do
  def parse_response(response) do
    response |> Map.get(:resouces) |> Enum.map(&parse_resource/1) |> Map.new()
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
