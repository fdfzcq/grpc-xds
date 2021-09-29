defmodule Envoy.Admin.V3.SimpleMetric.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :COUNTER | :GAUGE

  field(:COUNTER, 0)
  field(:GAUGE, 1)
end

defmodule Envoy.Admin.V3.SimpleMetric do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Envoy.Admin.V3.SimpleMetric.Type.t(),
          value: non_neg_integer,
          name: String.t()
        }
  defstruct [:type, :value, :name]

  field(:type, 1, type: Envoy.Admin.V3.SimpleMetric.Type, enum: true)
  field(:value, 2, type: :uint64)
  field(:name, 3, type: :string)
end
