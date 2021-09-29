defmodule Envoy.Type.Int64Range do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start: integer,
          end: integer
        }
  defstruct [:start, :end]

  field(:start, 1, type: :int64)
  field(:end, 2, type: :int64)
end

defmodule Envoy.Type.Int32Range do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start: integer,
          end: integer
        }
  defstruct [:start, :end]

  field(:start, 1, type: :int32)
  field(:end, 2, type: :int32)
end

defmodule Envoy.Type.DoubleRange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          start: float | :infinity | :negative_infinity | :nan,
          end: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:start, :end]

  field(:start, 1, type: :double)
  field(:end, 2, type: :double)
end
