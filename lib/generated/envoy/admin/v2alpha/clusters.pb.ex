defmodule Envoy.Admin.V2alpha.Clusters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_statuses: [Envoy.Admin.V2alpha.ClusterStatus.t()]
        }
  defstruct [:cluster_statuses]

  field(:cluster_statuses, 1, repeated: true, type: Envoy.Admin.V2alpha.ClusterStatus)
end

defmodule Envoy.Admin.V2alpha.ClusterStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          added_via_api: boolean,
          success_rate_ejection_threshold: Envoy.Type.Percent.t() | nil,
          host_statuses: [Envoy.Admin.V2alpha.HostStatus.t()],
          local_origin_success_rate_ejection_threshold: Envoy.Type.Percent.t() | nil
        }
  defstruct [
    :name,
    :added_via_api,
    :success_rate_ejection_threshold,
    :host_statuses,
    :local_origin_success_rate_ejection_threshold
  ]

  field(:name, 1, type: :string)
  field(:added_via_api, 2, type: :bool)
  field(:success_rate_ejection_threshold, 3, type: Envoy.Type.Percent)
  field(:host_statuses, 4, repeated: true, type: Envoy.Admin.V2alpha.HostStatus)
  field(:local_origin_success_rate_ejection_threshold, 5, type: Envoy.Type.Percent)
end

defmodule Envoy.Admin.V2alpha.HostStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Api.V2.Core.Address.t() | nil,
          stats: [Envoy.Admin.V2alpha.SimpleMetric.t()],
          health_status: Envoy.Admin.V2alpha.HostHealthStatus.t() | nil,
          success_rate: Envoy.Type.Percent.t() | nil,
          weight: non_neg_integer,
          hostname: String.t(),
          priority: non_neg_integer,
          local_origin_success_rate: Envoy.Type.Percent.t() | nil,
          locality: Envoy.Api.V2.Core.Locality.t() | nil
        }
  defstruct [
    :address,
    :stats,
    :health_status,
    :success_rate,
    :weight,
    :hostname,
    :priority,
    :local_origin_success_rate,
    :locality
  ]

  field(:address, 1, type: Envoy.Api.V2.Core.Address)
  field(:stats, 2, repeated: true, type: Envoy.Admin.V2alpha.SimpleMetric)
  field(:health_status, 3, type: Envoy.Admin.V2alpha.HostHealthStatus)
  field(:success_rate, 4, type: Envoy.Type.Percent)
  field(:weight, 5, type: :uint32)
  field(:hostname, 6, type: :string)
  field(:priority, 7, type: :uint32)
  field(:local_origin_success_rate, 8, type: Envoy.Type.Percent)
  field(:locality, 9, type: Envoy.Api.V2.Core.Locality)
end

defmodule Envoy.Admin.V2alpha.HostHealthStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_active_health_check: boolean,
          failed_outlier_check: boolean,
          failed_active_degraded_check: boolean,
          pending_dynamic_removal: boolean,
          pending_active_hc: boolean,
          eds_health_status: Envoy.Api.V2.Core.HealthStatus.t()
        }
  defstruct [
    :failed_active_health_check,
    :failed_outlier_check,
    :failed_active_degraded_check,
    :pending_dynamic_removal,
    :pending_active_hc,
    :eds_health_status
  ]

  field(:failed_active_health_check, 1, type: :bool)
  field(:failed_outlier_check, 2, type: :bool)
  field(:failed_active_degraded_check, 4, type: :bool)
  field(:pending_dynamic_removal, 5, type: :bool)
  field(:pending_active_hc, 6, type: :bool)
  field(:eds_health_status, 3, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
end
