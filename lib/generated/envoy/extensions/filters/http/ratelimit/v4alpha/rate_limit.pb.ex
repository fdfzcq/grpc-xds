defmodule Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimit.XRateLimitHeadersRFCVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :OFF | :DRAFT_VERSION_03

  field(:OFF, 0)
  field(:DRAFT_VERSION_03, 1)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimitPerRoute.VhRateLimitsOptions do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :OVERRIDE | :INCLUDE | :IGNORE

  field(:OVERRIDE, 0)
  field(:INCLUDE, 1)
  field(:IGNORE, 2)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          domain: String.t(),
          stage: non_neg_integer,
          request_type: String.t(),
          timeout: Google.Protobuf.Duration.t() | nil,
          failure_mode_deny: boolean,
          rate_limited_as_resource_exhausted: boolean,
          rate_limit_service: Envoy.Config.Ratelimit.V4alpha.RateLimitServiceConfig.t() | nil,
          enable_x_ratelimit_headers:
            Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimit.XRateLimitHeadersRFCVersion.t(),
          disable_x_envoy_ratelimited_header: boolean
        }
  defstruct [
    :domain,
    :stage,
    :request_type,
    :timeout,
    :failure_mode_deny,
    :rate_limited_as_resource_exhausted,
    :rate_limit_service,
    :enable_x_ratelimit_headers,
    :disable_x_envoy_ratelimited_header
  ]

  field(:domain, 1, type: :string)
  field(:stage, 2, type: :uint32)
  field(:request_type, 3, type: :string)
  field(:timeout, 4, type: Google.Protobuf.Duration)
  field(:failure_mode_deny, 5, type: :bool)
  field(:rate_limited_as_resource_exhausted, 6, type: :bool)
  field(:rate_limit_service, 7, type: Envoy.Config.Ratelimit.V4alpha.RateLimitServiceConfig)

  field(:enable_x_ratelimit_headers, 8,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimit.XRateLimitHeadersRFCVersion,
    enum: true
  )

  field(:disable_x_envoy_ratelimited_header, 9, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimitPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          vh_rate_limits:
            Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimitPerRoute.VhRateLimitsOptions.t()
        }
  defstruct [:vh_rate_limits]

  field(:vh_rate_limits, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V4alpha.RateLimitPerRoute.VhRateLimitsOptions,
    enum: true
  )
end
