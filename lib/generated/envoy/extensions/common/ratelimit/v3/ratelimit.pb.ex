defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requests_per_unit: non_neg_integer,
          unit: Envoy.Type.V3.RateLimitUnit.t()
        }
  defstruct [:requests_per_unit, :unit]

  field(:requests_per_unit, 1, type: :uint32)
  field(:unit, 2, type: Envoy.Type.V3.RateLimitUnit, enum: true)
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entries: [Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry.t()],
          limit:
            Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride.t() | nil
        }
  defstruct [:entries, :limit]

  field(:entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry
  )

  field(:limit, 2,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride
  )
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entries: [Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry.t()],
          token_bucket: Envoy.Type.V3.TokenBucket.t() | nil
        }
  defstruct [:entries, :token_bucket]

  field(:entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry
  )

  field(:token_bucket, 2, type: Envoy.Type.V3.TokenBucket)
end
