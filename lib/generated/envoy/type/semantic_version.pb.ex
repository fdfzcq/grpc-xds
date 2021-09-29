defmodule Envoy.Type.SemanticVersion do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          major_number: non_neg_integer,
          minor_number: non_neg_integer,
          patch: non_neg_integer
        }
  defstruct [:major_number, :minor_number, :patch]

  field(:major_number, 1, type: :uint32)
  field(:minor_number, 2, type: :uint32)
  field(:patch, 3, type: :uint32)
end
