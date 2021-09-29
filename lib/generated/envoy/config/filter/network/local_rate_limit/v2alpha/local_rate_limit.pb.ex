defmodule Envoy.Config.Filter.Network.LocalRateLimit.V2alpha.LocalRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          token_bucket: Envoy.Type.TokenBucket.t() | nil,
          runtime_enabled: Envoy.Api.V2.Core.RuntimeFeatureFlag.t() | nil
        }
  defstruct [:stat_prefix, :token_bucket, :runtime_enabled]

  field(:stat_prefix, 1, type: :string)
  field(:token_bucket, 2, type: Envoy.Type.TokenBucket)
  field(:runtime_enabled, 3, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
end
