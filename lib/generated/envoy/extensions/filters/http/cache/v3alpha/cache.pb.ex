defmodule Envoy.Extensions.Filters.Http.Cache.V3alpha.CacheConfig.KeyCreatorParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          exclude_scheme: boolean,
          exclude_host: boolean,
          query_parameters_included: [Envoy.Config.Route.V3.QueryParameterMatcher.t()],
          query_parameters_excluded: [Envoy.Config.Route.V3.QueryParameterMatcher.t()]
        }
  defstruct [
    :exclude_scheme,
    :exclude_host,
    :query_parameters_included,
    :query_parameters_excluded
  ]

  field(:exclude_scheme, 1, type: :bool)
  field(:exclude_host, 2, type: :bool)

  field(:query_parameters_included, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher
  )

  field(:query_parameters_excluded, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher
  )
end

defmodule Envoy.Extensions.Filters.Http.Cache.V3alpha.CacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          typed_config: Google.Protobuf.Any.t() | nil,
          allowed_vary_headers: [Envoy.Type.Matcher.V3.StringMatcher.t()],
          key_creator_params:
            Envoy.Extensions.Filters.Http.Cache.V3alpha.CacheConfig.KeyCreatorParams.t() | nil,
          max_body_bytes: non_neg_integer
        }
  defstruct [:typed_config, :allowed_vary_headers, :key_creator_params, :max_body_bytes]

  field(:typed_config, 1, type: Google.Protobuf.Any)
  field(:allowed_vary_headers, 2, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)

  field(:key_creator_params, 3,
    type: Envoy.Extensions.Filters.Http.Cache.V3alpha.CacheConfig.KeyCreatorParams
  )

  field(:max_body_bytes, 4, type: :uint32)
end
