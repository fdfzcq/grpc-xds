defmodule Envoy.Extensions.Filters.Network.LocalRatelimit.V3.LocalRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          token_bucket: Envoy.Type.V3.TokenBucket.t() | nil,
          runtime_enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil
        }
  defstruct [:stat_prefix, :token_bucket, :runtime_enabled]

  field(:stat_prefix, 1, type: :string)
  field(:token_bucket, 2, type: Envoy.Type.V3.TokenBucket)
  field(:runtime_enabled, 3, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
end
