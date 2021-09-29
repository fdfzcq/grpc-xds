defmodule Envoy.Config.Filter.Http.Fault.V2.FaultAbort.HeaderAbort do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Http.Fault.V2.FaultAbort do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          error_type: {atom, any},
          percentage: Envoy.Type.FractionalPercent.t() | nil
        }
  defstruct [:error_type, :percentage]

  oneof(:error_type, 0)
  field(:http_status, 2, type: :uint32, oneof: 0)

  field(:header_abort, 4, type: Envoy.Config.Filter.Http.Fault.V2.FaultAbort.HeaderAbort, oneof: 0)

  field(:percentage, 3, type: Envoy.Type.FractionalPercent)
end

defmodule Envoy.Config.Filter.Http.Fault.V2.HTTPFault do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          delay: Envoy.Config.Filter.Fault.V2.FaultDelay.t() | nil,
          abort: Envoy.Config.Filter.Http.Fault.V2.FaultAbort.t() | nil,
          upstream_cluster: String.t(),
          headers: [Envoy.Api.V2.Route.HeaderMatcher.t()],
          downstream_nodes: [String.t()],
          max_active_faults: Google.Protobuf.UInt32Value.t() | nil,
          response_rate_limit: Envoy.Config.Filter.Fault.V2.FaultRateLimit.t() | nil,
          delay_percent_runtime: String.t(),
          abort_percent_runtime: String.t(),
          delay_duration_runtime: String.t(),
          abort_http_status_runtime: String.t(),
          max_active_faults_runtime: String.t(),
          response_rate_limit_percent_runtime: String.t()
        }
  defstruct [
    :delay,
    :abort,
    :upstream_cluster,
    :headers,
    :downstream_nodes,
    :max_active_faults,
    :response_rate_limit,
    :delay_percent_runtime,
    :abort_percent_runtime,
    :delay_duration_runtime,
    :abort_http_status_runtime,
    :max_active_faults_runtime,
    :response_rate_limit_percent_runtime
  ]

  field(:delay, 1, type: Envoy.Config.Filter.Fault.V2.FaultDelay)
  field(:abort, 2, type: Envoy.Config.Filter.Http.Fault.V2.FaultAbort)
  field(:upstream_cluster, 3, type: :string)
  field(:headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:downstream_nodes, 5, repeated: true, type: :string)
  field(:max_active_faults, 6, type: Google.Protobuf.UInt32Value)
  field(:response_rate_limit, 7, type: Envoy.Config.Filter.Fault.V2.FaultRateLimit)
  field(:delay_percent_runtime, 8, type: :string)
  field(:abort_percent_runtime, 9, type: :string)
  field(:delay_duration_runtime, 10, type: :string)
  field(:abort_http_status_runtime, 11, type: :string)
  field(:max_active_faults_runtime, 12, type: :string)
  field(:response_rate_limit_percent_runtime, 13, type: :string)
end
