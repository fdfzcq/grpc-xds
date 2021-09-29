defmodule Envoy.Config.Cluster.V3.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          consecutive_5xx: Google.Protobuf.UInt32Value.t() | nil,
          interval: Google.Protobuf.Duration.t() | nil,
          base_ejection_time: Google.Protobuf.Duration.t() | nil,
          max_ejection_percent: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_consecutive_5xx: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_success_rate: Google.Protobuf.UInt32Value.t() | nil,
          success_rate_minimum_hosts: Google.Protobuf.UInt32Value.t() | nil,
          success_rate_request_volume: Google.Protobuf.UInt32Value.t() | nil,
          success_rate_stdev_factor: Google.Protobuf.UInt32Value.t() | nil,
          consecutive_gateway_failure: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_consecutive_gateway_failure: Google.Protobuf.UInt32Value.t() | nil,
          split_external_local_origin_errors: boolean,
          consecutive_local_origin_failure: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_consecutive_local_origin_failure: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_local_origin_success_rate: Google.Protobuf.UInt32Value.t() | nil,
          failure_percentage_threshold: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_failure_percentage: Google.Protobuf.UInt32Value.t() | nil,
          enforcing_failure_percentage_local_origin: Google.Protobuf.UInt32Value.t() | nil,
          failure_percentage_minimum_hosts: Google.Protobuf.UInt32Value.t() | nil,
          failure_percentage_request_volume: Google.Protobuf.UInt32Value.t() | nil,
          max_ejection_time: Google.Protobuf.Duration.t() | nil
        }
  defstruct [
    :consecutive_5xx,
    :interval,
    :base_ejection_time,
    :max_ejection_percent,
    :enforcing_consecutive_5xx,
    :enforcing_success_rate,
    :success_rate_minimum_hosts,
    :success_rate_request_volume,
    :success_rate_stdev_factor,
    :consecutive_gateway_failure,
    :enforcing_consecutive_gateway_failure,
    :split_external_local_origin_errors,
    :consecutive_local_origin_failure,
    :enforcing_consecutive_local_origin_failure,
    :enforcing_local_origin_success_rate,
    :failure_percentage_threshold,
    :enforcing_failure_percentage,
    :enforcing_failure_percentage_local_origin,
    :failure_percentage_minimum_hosts,
    :failure_percentage_request_volume,
    :max_ejection_time
  ]

  field(:consecutive_5xx, 1, type: Google.Protobuf.UInt32Value)
  field(:interval, 2, type: Google.Protobuf.Duration)
  field(:base_ejection_time, 3, type: Google.Protobuf.Duration)
  field(:max_ejection_percent, 4, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_5xx, 5, type: Google.Protobuf.UInt32Value)
  field(:enforcing_success_rate, 6, type: Google.Protobuf.UInt32Value)
  field(:success_rate_minimum_hosts, 7, type: Google.Protobuf.UInt32Value)
  field(:success_rate_request_volume, 8, type: Google.Protobuf.UInt32Value)
  field(:success_rate_stdev_factor, 9, type: Google.Protobuf.UInt32Value)
  field(:consecutive_gateway_failure, 10, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_gateway_failure, 11, type: Google.Protobuf.UInt32Value)
  field(:split_external_local_origin_errors, 12, type: :bool)
  field(:consecutive_local_origin_failure, 13, type: Google.Protobuf.UInt32Value)
  field(:enforcing_consecutive_local_origin_failure, 14, type: Google.Protobuf.UInt32Value)
  field(:enforcing_local_origin_success_rate, 15, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_threshold, 16, type: Google.Protobuf.UInt32Value)
  field(:enforcing_failure_percentage, 17, type: Google.Protobuf.UInt32Value)
  field(:enforcing_failure_percentage_local_origin, 18, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_minimum_hosts, 19, type: Google.Protobuf.UInt32Value)
  field(:failure_percentage_request_volume, 20, type: Google.Protobuf.UInt32Value)
  field(:max_ejection_time, 21, type: Google.Protobuf.Duration)
end
