defmodule Envoy.Config.Route.V3.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          virtual_hosts: [Envoy.Config.Route.V3.VirtualHost.t()],
          vhds: Envoy.Config.Route.V3.Vhds.t() | nil,
          internal_only_headers: [String.t()],
          response_headers_to_add: [Envoy.Config.Core.V3.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          request_headers_to_add: [Envoy.Config.Core.V3.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          most_specific_header_mutations_wins: boolean,
          validate_clusters: Google.Protobuf.BoolValue.t() | nil,
          max_direct_response_body_size_bytes: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :name,
    :virtual_hosts,
    :vhds,
    :internal_only_headers,
    :response_headers_to_add,
    :response_headers_to_remove,
    :request_headers_to_add,
    :request_headers_to_remove,
    :most_specific_header_mutations_wins,
    :validate_clusters,
    :max_direct_response_body_size_bytes
  ]

  field(:name, 1, type: :string)
  field(:virtual_hosts, 2, repeated: true, type: Envoy.Config.Route.V3.VirtualHost)
  field(:vhds, 9, type: Envoy.Config.Route.V3.Vhds)
  field(:internal_only_headers, 3, repeated: true, type: :string)
  field(:response_headers_to_add, 4, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
  field(:response_headers_to_remove, 5, repeated: true, type: :string)
  field(:request_headers_to_add, 6, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
  field(:request_headers_to_remove, 8, repeated: true, type: :string)
  field(:most_specific_header_mutations_wins, 10, type: :bool)
  field(:validate_clusters, 7, type: Google.Protobuf.BoolValue)
  field(:max_direct_response_body_size_bytes, 11, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Route.V3.Vhds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil
        }
  defstruct [:config_source]

  field(:config_source, 1, type: Envoy.Config.Core.V3.ConfigSource)
end
