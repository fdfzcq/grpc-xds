defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.HttpCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_success_status: [Envoy.Type.V3.Int32Range.t()]
        }
  defstruct [:http_success_status]

  field(:http_success_status, 1, repeated: true, type: Envoy.Type.V3.Int32Range)
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.GrpcCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_success_status: [non_neg_integer]
        }
  defstruct [:grpc_success_status]

  field(:grpc_success_status, 1, repeated: true, type: :uint32)
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_criteria:
            Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.HttpCriteria.t()
            | nil,
          grpc_criteria:
            Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.GrpcCriteria.t()
            | nil
        }
  defstruct [:http_criteria, :grpc_criteria]

  field(:http_criteria, 1,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.HttpCriteria
  )

  field(:grpc_criteria, 2,
    type:
      Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria.GrpcCriteria
  )
end

defmodule Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          evaluation_criteria: {atom, any},
          enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil,
          sampling_window: Google.Protobuf.Duration.t() | nil,
          aggression: Envoy.Config.Core.V3.RuntimeDouble.t() | nil,
          sr_threshold: Envoy.Config.Core.V3.RuntimePercent.t() | nil
        }
  defstruct [:evaluation_criteria, :enabled, :sampling_window, :aggression, :sr_threshold]

  oneof(:evaluation_criteria, 0)
  field(:enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)

  field(:success_criteria, 2,
    type: Envoy.Extensions.Filters.Http.AdmissionControl.V3alpha.AdmissionControl.SuccessCriteria,
    oneof: 0
  )

  field(:sampling_window, 3, type: Google.Protobuf.Duration)
  field(:aggression, 4, type: Envoy.Config.Core.V3.RuntimeDouble)
  field(:sr_threshold, 5, type: Envoy.Config.Core.V3.RuntimePercent)
end
