defmodule Envoy.Config.Filter.Http.RateLimit.V2.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          domain: String.t(),
          stage: non_neg_integer,
          request_type: String.t(),
          timeout: Google.Protobuf.Duration.t() | nil,
          failure_mode_deny: boolean,
          rate_limited_as_resource_exhausted: boolean,
          rate_limit_service: Envoy.Config.Ratelimit.V2.RateLimitServiceConfig.t() | nil
        }
  defstruct [
    :domain,
    :stage,
    :request_type,
    :timeout,
    :failure_mode_deny,
    :rate_limited_as_resource_exhausted,
    :rate_limit_service
  ]

  field(:domain, 1, type: :string)
  field(:stage, 2, type: :uint32)
  field(:request_type, 3, type: :string)
  field(:timeout, 4, type: Google.Protobuf.Duration)
  field(:failure_mode_deny, 5, type: :bool)
  field(:rate_limited_as_resource_exhausted, 6, type: :bool)
  field(:rate_limit_service, 7, type: Envoy.Config.Ratelimit.V2.RateLimitServiceConfig)
end
