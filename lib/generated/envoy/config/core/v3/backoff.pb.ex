defmodule Envoy.Config.Core.V3.BackoffStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          base_interval: Google.Protobuf.Duration.t() | nil,
          max_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:base_interval, :max_interval]

  field(:base_interval, 1, type: Google.Protobuf.Duration)
  field(:max_interval, 2, type: Google.Protobuf.Duration)
end
