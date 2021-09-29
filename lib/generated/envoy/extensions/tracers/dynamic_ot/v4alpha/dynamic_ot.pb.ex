defmodule Envoy.Extensions.Tracers.DynamicOt.V4alpha.DynamicOtConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          library: String.t(),
          config: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:library, :config]

  field(:library, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct)
end
