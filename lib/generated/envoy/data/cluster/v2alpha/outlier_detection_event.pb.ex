defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectionType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :CONSECUTIVE_5XX
          | :CONSECUTIVE_GATEWAY_FAILURE
          | :SUCCESS_RATE
          | :CONSECUTIVE_LOCAL_ORIGIN_FAILURE
          | :SUCCESS_RATE_LOCAL_ORIGIN
          | :FAILURE_PERCENTAGE
          | :FAILURE_PERCENTAGE_LOCAL_ORIGIN

  field(:CONSECUTIVE_5XX, 0)
  field(:CONSECUTIVE_GATEWAY_FAILURE, 1)
  field(:SUCCESS_RATE, 2)
  field(:CONSECUTIVE_LOCAL_ORIGIN_FAILURE, 3)
  field(:SUCCESS_RATE_LOCAL_ORIGIN, 4)
  field(:FAILURE_PERCENTAGE, 5)
  field(:FAILURE_PERCENTAGE_LOCAL_ORIGIN, 6)
end

defmodule Envoy.Data.Cluster.V2alpha.Action do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :EJECT | :UNEJECT

  field(:EJECT, 0)
  field(:UNEJECT, 1)
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierDetectionEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event: {atom, any},
          type: Envoy.Data.Cluster.V2alpha.OutlierEjectionType.t(),
          timestamp: Google.Protobuf.Timestamp.t() | nil,
          secs_since_last_action: Google.Protobuf.UInt64Value.t() | nil,
          cluster_name: String.t(),
          upstream_url: String.t(),
          action: Envoy.Data.Cluster.V2alpha.Action.t(),
          num_ejections: non_neg_integer,
          enforced: boolean
        }
  defstruct [
    :event,
    :type,
    :timestamp,
    :secs_since_last_action,
    :cluster_name,
    :upstream_url,
    :action,
    :num_ejections,
    :enforced
  ]

  oneof(:event, 0)
  field(:type, 1, type: Envoy.Data.Cluster.V2alpha.OutlierEjectionType, enum: true)
  field(:timestamp, 2, type: Google.Protobuf.Timestamp)
  field(:secs_since_last_action, 3, type: Google.Protobuf.UInt64Value)
  field(:cluster_name, 4, type: :string)
  field(:upstream_url, 5, type: :string)
  field(:action, 6, type: Envoy.Data.Cluster.V2alpha.Action, enum: true)
  field(:num_ejections, 7, type: :uint32)
  field(:enforced, 8, type: :bool)

  field(:eject_success_rate_event, 9,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectSuccessRate,
    oneof: 0
  )

  field(:eject_consecutive_event, 10,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectConsecutive,
    oneof: 0
  )

  field(:eject_failure_percentage_event, 11,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectFailurePercentage,
    oneof: 0
  )
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectSuccessRate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_success_rate: non_neg_integer,
          cluster_average_success_rate: non_neg_integer,
          cluster_success_rate_ejection_threshold: non_neg_integer
        }
  defstruct [
    :host_success_rate,
    :cluster_average_success_rate,
    :cluster_success_rate_ejection_threshold
  ]

  field(:host_success_rate, 1, type: :uint32)
  field(:cluster_average_success_rate, 2, type: :uint32)
  field(:cluster_success_rate_ejection_threshold, 3, type: :uint32)
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectConsecutive do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectFailurePercentage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_success_rate: non_neg_integer
        }
  defstruct [:host_success_rate]

  field(:host_success_rate, 1, type: :uint32)
end
