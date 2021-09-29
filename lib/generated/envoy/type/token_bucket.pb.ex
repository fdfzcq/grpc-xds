defmodule Envoy.Type.TokenBucket do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_tokens: non_neg_integer,
          tokens_per_fill: Google.Protobuf.UInt32Value.t() | nil,
          fill_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:max_tokens, :tokens_per_fill, :fill_interval]

  field(:max_tokens, 1, type: :uint32)
  field(:tokens_per_fill, 2, type: Google.Protobuf.UInt32Value)
  field(:fill_interval, 3, type: Google.Protobuf.Duration)
end
