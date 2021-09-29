defmodule Opencensus.Proto.Resource.V1.Resource.LabelsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Opencensus.Proto.Resource.V1.Resource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: String.t(),
          labels: %{String.t() => String.t()}
        }
  defstruct [:type, :labels]

  field(:type, 1, type: :string)

  field(:labels, 2,
    repeated: true,
    type: Opencensus.Proto.Resource.V1.Resource.LabelsEntry,
    map: true
  )
end
