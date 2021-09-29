defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.RetryBudget do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          budget_percent: Envoy.Type.V3.Percent.t() | nil,
          min_retry_concurrency: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:budget_percent, :min_retry_concurrency]

  field(:budget_percent, 1, type: Envoy.Type.V3.Percent)
  field(:min_retry_concurrency, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          priority: Envoy.Config.Core.V4alpha.RoutingPriority.t(),
          max_connections: Google.Protobuf.UInt32Value.t() | nil,
          max_pending_requests: Google.Protobuf.UInt32Value.t() | nil,
          max_requests: Google.Protobuf.UInt32Value.t() | nil,
          max_retries: Google.Protobuf.UInt32Value.t() | nil,
          retry_budget:
            Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.RetryBudget.t() | nil,
          track_remaining: boolean,
          max_connection_pools: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :priority,
    :max_connections,
    :max_pending_requests,
    :max_requests,
    :max_retries,
    :retry_budget,
    :track_remaining,
    :max_connection_pools
  ]

  field(:priority, 1, type: Envoy.Config.Core.V4alpha.RoutingPriority, enum: true)
  field(:max_connections, 2, type: Google.Protobuf.UInt32Value)
  field(:max_pending_requests, 3, type: Google.Protobuf.UInt32Value)
  field(:max_requests, 4, type: Google.Protobuf.UInt32Value)
  field(:max_retries, 5, type: Google.Protobuf.UInt32Value)

  field(:retry_budget, 8,
    type: Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.RetryBudget
  )

  field(:track_remaining, 6, type: :bool)
  field(:max_connection_pools, 7, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Cluster.V4alpha.CircuitBreakers do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          thresholds: [Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds.t()]
        }
  defstruct [:thresholds]

  field(:thresholds, 1,
    repeated: true,
    type: Envoy.Config.Cluster.V4alpha.CircuitBreakers.Thresholds
  )
end
