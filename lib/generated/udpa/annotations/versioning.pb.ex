defmodule Udpa.Annotations.VersioningAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          previous_message_type: String.t()
        }
  defstruct [:previous_message_type]

  field(:previous_message_type, 1, type: :string)
end
