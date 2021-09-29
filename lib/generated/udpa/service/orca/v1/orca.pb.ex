defmodule Udpa.Service.Orca.V1.OrcaLoadReportRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          report_interval: Google.Protobuf.Duration.t() | nil,
          request_cost_names: [String.t()]
        }
  defstruct [:report_interval, :request_cost_names]

  field(:report_interval, 1, type: Google.Protobuf.Duration)
  field(:request_cost_names, 2, repeated: true, type: :string)
end
