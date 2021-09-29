defmodule Envoy.Extensions.Filters.Http.LocalRatelimit.V3.LocalRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          status: Envoy.Type.V3.HttpStatus.t() | nil,
          token_bucket: Envoy.Type.V3.TokenBucket.t() | nil,
          filter_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          filter_enforced: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          response_headers_to_add: [Envoy.Config.Core.V3.HeaderValueOption.t()],
          descriptors: [Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor.t()],
          stage: non_neg_integer
        }
  defstruct [
    :stat_prefix,
    :status,
    :token_bucket,
    :filter_enabled,
    :filter_enforced,
    :response_headers_to_add,
    :descriptors,
    :stage
  ]

  field(:stat_prefix, 1, type: :string)
  field(:status, 2, type: Envoy.Type.V3.HttpStatus)
  field(:token_bucket, 3, type: Envoy.Type.V3.TokenBucket)
  field(:filter_enabled, 4, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:filter_enforced, 5, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:response_headers_to_add, 6, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)

  field(:descriptors, 8,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor
  )

  field(:stage, 9, type: :uint32)
end
