defmodule Envoy.Service.Discovery.V2.RtdsDummy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Service.Discovery.V2.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          layer: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:name, :layer]

  field(:name, 1, type: :string)
  field(:layer, 2, type: Google.Protobuf.Struct)
end
