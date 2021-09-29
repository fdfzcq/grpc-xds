defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.Code do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :OK | :OVER_LIMIT

  field(:UNKNOWN, 0)
  field(:OK, 1)
  field(:OVER_LIMIT, 2)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :SECOND | :MINUTE | :HOUR | :DAY

  field(:UNKNOWN, 0)
  field(:SECOND, 1)
  field(:MINUTE, 2)
  field(:HOUR, 3)
  field(:DAY, 4)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          domain: String.t(),
          descriptors: [Envoy.Api.V2.Ratelimit.RateLimitDescriptor.t()],
          hits_addend: non_neg_integer
        }
  defstruct [:domain, :descriptors, :hits_addend]

  field(:domain, 1, type: :string)
  field(:descriptors, 2, repeated: true, type: Envoy.Api.V2.Ratelimit.RateLimitDescriptor)
  field(:hits_addend, 3, type: :uint32)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          requests_per_unit: non_neg_integer,
          unit: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit.t()
        }
  defstruct [:name, :requests_per_unit, :unit]

  field(:name, 3, type: :string)
  field(:requests_per_unit, 1, type: :uint32)
  field(:unit, 2, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.Unit, enum: true)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code.t(),
          current_limit: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit.t() | nil,
          limit_remaining: non_neg_integer
        }
  defstruct [:code, :current_limit, :limit_remaining]

  field(:code, 1, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code, enum: true)
  field(:current_limit, 2, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.RateLimit)
  field(:limit_remaining, 3, type: :uint32)
end

defmodule Envoy.Service.Ratelimit.V2.RateLimitResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          overall_code: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code.t(),
          statuses: [Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus.t()],
          headers: [Envoy.Api.V2.Core.HeaderValue.t()],
          request_headers_to_add: [Envoy.Api.V2.Core.HeaderValue.t()]
        }
  defstruct [:overall_code, :statuses, :headers, :request_headers_to_add]

  field(:overall_code, 1, type: Envoy.Service.Ratelimit.V2.RateLimitResponse.Code, enum: true)

  field(:statuses, 2,
    repeated: true,
    type: Envoy.Service.Ratelimit.V2.RateLimitResponse.DescriptorStatus
  )

  field(:headers, 3, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
  field(:request_headers_to_add, 4, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end
