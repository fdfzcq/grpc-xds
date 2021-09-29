defmodule Envoy.Config.Cluster.Redis.RedisClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_refresh_rate: Google.Protobuf.Duration.t() | nil,
          cluster_refresh_timeout: Google.Protobuf.Duration.t() | nil,
          redirect_refresh_interval: Google.Protobuf.Duration.t() | nil,
          redirect_refresh_threshold: Google.Protobuf.UInt32Value.t() | nil,
          failure_refresh_threshold: non_neg_integer,
          host_degraded_refresh_threshold: non_neg_integer
        }
  defstruct [
    :cluster_refresh_rate,
    :cluster_refresh_timeout,
    :redirect_refresh_interval,
    :redirect_refresh_threshold,
    :failure_refresh_threshold,
    :host_degraded_refresh_threshold
  ]

  field(:cluster_refresh_rate, 1, type: Google.Protobuf.Duration)
  field(:cluster_refresh_timeout, 2, type: Google.Protobuf.Duration)
  field(:redirect_refresh_interval, 3, type: Google.Protobuf.Duration)
  field(:redirect_refresh_threshold, 4, type: Google.Protobuf.UInt32Value)
  field(:failure_refresh_threshold, 5, type: :uint32)
  field(:host_degraded_refresh_threshold, 6, type: :uint32)
end
