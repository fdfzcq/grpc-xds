defmodule Udpa.Data.Orca.V1.OrcaLoadReport.RequestCostEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :double)
end

defmodule Udpa.Data.Orca.V1.OrcaLoadReport.UtilizationEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :double)
end

defmodule Udpa.Data.Orca.V1.OrcaLoadReport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cpu_utilization: float | :infinity | :negative_infinity | :nan,
          mem_utilization: float | :infinity | :negative_infinity | :nan,
          rps: non_neg_integer,
          request_cost: %{String.t() => float | :infinity | :negative_infinity | :nan},
          utilization: %{String.t() => float | :infinity | :negative_infinity | :nan}
        }
  defstruct [:cpu_utilization, :mem_utilization, :rps, :request_cost, :utilization]

  field(:cpu_utilization, 1, type: :double)
  field(:mem_utilization, 2, type: :double)
  field(:rps, 3, type: :uint64)

  field(:request_cost, 4,
    repeated: true,
    type: Udpa.Data.Orca.V1.OrcaLoadReport.RequestCostEntry,
    map: true
  )

  field(:utilization, 5,
    repeated: true,
    type: Udpa.Data.Orca.V1.OrcaLoadReport.UtilizationEntry,
    map: true
  )
end
