defmodule Envoy.Service.LoadStats.V3.LoadStatsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V3.Node.t() | nil,
          cluster_stats: [Envoy.Config.Endpoint.V3.ClusterStats.t()]
        }
  defstruct [:node, :cluster_stats]

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:cluster_stats, 2, repeated: true, type: Envoy.Config.Endpoint.V3.ClusterStats)
end

defmodule Envoy.Service.LoadStats.V3.LoadStatsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [String.t()],
          send_all_clusters: boolean,
          load_reporting_interval: Google.Protobuf.Duration.t() | nil,
          report_endpoint_granularity: boolean
        }
  defstruct [
    :clusters,
    :send_all_clusters,
    :load_reporting_interval,
    :report_endpoint_granularity
  ]

  field(:clusters, 1, repeated: true, type: :string)
  field(:send_all_clusters, 4, type: :bool)
  field(:load_reporting_interval, 2, type: Google.Protobuf.Duration)
  field(:report_endpoint_granularity, 3, type: :bool)
end
