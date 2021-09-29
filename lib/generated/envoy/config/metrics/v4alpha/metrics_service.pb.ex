defmodule Envoy.Config.Metrics.V4alpha.MetricsServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil,
          transport_api_version: Envoy.Config.Core.V4alpha.ApiVersion.t(),
          report_counters_as_deltas: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:grpc_service, :transport_api_version, :report_counters_as_deltas]

  field(:grpc_service, 1, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:transport_api_version, 3, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
  field(:report_counters_as_deltas, 2, type: Google.Protobuf.BoolValue)
end
