defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dns_cache_config:
            Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig.t() | nil
        }
  defstruct [:dns_cache_config]

  field(:dns_cache_config, 1, type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig)
end

defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_rewrite_specifier: {atom, any}
        }
  defstruct [:host_rewrite_specifier]

  oneof(:host_rewrite_specifier, 0)
  field(:host_rewrite, 1, type: :string, oneof: 0)
  field(:auto_host_rewrite_header, 2, type: :string, oneof: 0)
end
