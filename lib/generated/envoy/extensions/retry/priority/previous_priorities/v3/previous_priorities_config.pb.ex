defmodule Envoy.Extensions.Retry.Priority.PreviousPriorities.V3.PreviousPrioritiesConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          update_frequency: integer
        }
  defstruct [:update_frequency]

  field(:update_frequency, 1, type: :int32)
end
