defmodule Envoy.Watchdog.V3alpha.AbortActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          wait_duration: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:wait_duration]

  field(:wait_duration, 1, type: Google.Protobuf.Duration)
end
