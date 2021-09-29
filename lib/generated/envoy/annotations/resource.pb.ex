defmodule Envoy.Annotations.ResourceAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: String.t()
        }
  defstruct [:type]

  field(:type, 1, type: :string)
end
