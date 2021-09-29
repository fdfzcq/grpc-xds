defmodule Envoy.Admin.V3.Clusters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_statuses: [Envoy.Admin.V3.ClusterStatus.t()]
        }
  defstruct [:cluster_statuses]

  field(:cluster_statuses, 1, repeated: true, type: Envoy.Admin.V3.ClusterStatus)
end

defmodule Envoy.Admin.V3.ClusterStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          added_via_api: boolean,
          success_rate_ejection_threshold: Envoy.Type.V3.Percent.t() | nil,
          host_statuses: [Envoy.Admin.V3.HostStatus.t()],
          local_origin_success_rate_ejection_threshold: Envoy.Type.V3.Percent.t() | nil,
          circuit_breakers: Envoy.Config.Cluster.V3.CircuitBreakers.t() | nil,
          observability_name: String.t()
        }
  defstruct [
    :name,
    :added_via_api,
    :success_rate_ejection_threshold,
    :host_statuses,
    :local_origin_success_rate_ejection_threshold,
    :circuit_breakers,
    :observability_name
  ]

  field(:name, 1, type: :string)
  field(:added_via_api, 2, type: :bool)
  field(:success_rate_ejection_threshold, 3, type: Envoy.Type.V3.Percent)
  field(:host_statuses, 4, repeated: true, type: Envoy.Admin.V3.HostStatus)
  field(:local_origin_success_rate_ejection_threshold, 5, type: Envoy.Type.V3.Percent)
  field(:circuit_breakers, 6, type: Envoy.Config.Cluster.V3.CircuitBreakers)
  field(:observability_name, 7, type: :string)
end

defmodule Envoy.Admin.V3.HostStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Config.Core.V3.Address.t() | nil,
          stats: [Envoy.Admin.V3.SimpleMetric.t()],
          health_status: Envoy.Admin.V3.HostHealthStatus.t() | nil,
          success_rate: Envoy.Type.V3.Percent.t() | nil,
          weight: non_neg_integer,
          hostname: String.t(),
          priority: non_neg_integer,
          local_origin_success_rate: Envoy.Type.V3.Percent.t() | nil,
          locality: Envoy.Config.Core.V3.Locality.t() | nil
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

  field(:address, 1, type: Envoy.Config.Core.V3.Address)
  field(:stats, 2, repeated: true, type: Envoy.Admin.V3.SimpleMetric)
  field(:health_status, 3, type: Envoy.Admin.V3.HostHealthStatus)
  field(:success_rate, 4, type: Envoy.Type.V3.Percent)
  field(:weight, 5, type: :uint32)
  field(:hostname, 6, type: :string)
  field(:priority, 7, type: :uint32)
  field(:local_origin_success_rate, 8, type: Envoy.Type.V3.Percent)
  field(:locality, 9, type: Envoy.Config.Core.V3.Locality)
end

defmodule Envoy.Admin.V3.HostHealthStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_active_health_check: boolean,
          failed_outlier_check: boolean,
          failed_active_degraded_check: boolean,
          pending_dynamic_removal: boolean,
          pending_active_hc: boolean,
          excluded_via_immediate_hc_fail: boolean,
          active_hc_timeout: boolean,
          eds_health_status: Envoy.Config.Core.V3.HealthStatus.t()
        }
  defstruct [
    :failed_active_health_check,
    :failed_outlier_check,
    :failed_active_degraded_check,
    :pending_dynamic_removal,
    :pending_active_hc,
    :excluded_via_immediate_hc_fail,
    :active_hc_timeout,
    :eds_health_status
  ]

  field(:failed_active_health_check, 1, type: :bool)
  field(:failed_outlier_check, 2, type: :bool)
  field(:failed_active_degraded_check, 4, type: :bool)
  field(:pending_dynamic_removal, 5, type: :bool)
  field(:pending_active_hc, 6, type: :bool)
  field(:excluded_via_immediate_hc_fail, 7, type: :bool)
  field(:active_hc_timeout, 8, type: :bool)
  field(:eds_health_status, 3, type: Envoy.Config.Core.V3.HealthStatus, enum: true)
end
