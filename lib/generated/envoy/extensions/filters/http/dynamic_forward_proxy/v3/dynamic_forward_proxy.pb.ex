defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dns_cache_config:
            Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig.t() | nil
        }
  defstruct [:dns_cache_config]

  field(:dns_cache_config, 1, type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig)
end

defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_rewrite_specifier: {atom, any}
        }
  defstruct [:host_rewrite_specifier]

  oneof(:host_rewrite_specifier, 0)
  field(:host_rewrite_literal, 1, type: :string, oneof: 0)
  field(:host_rewrite_header, 2, type: :string, oneof: 0)
end
