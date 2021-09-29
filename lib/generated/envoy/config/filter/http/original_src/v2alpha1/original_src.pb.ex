defmodule Envoy.Config.Filter.Http.OriginalSrc.V2alpha1.OriginalSrc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          mark: non_neg_integer
        }
  defstruct [:mark]

  field(:mark, 1, type: :uint32)
end
