defmodule Envoy.Config.Metrics.V3.MetricsServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil,
          transport_api_version: Envoy.Config.Core.V3.ApiVersion.t(),
          report_counters_as_deltas: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:grpc_service, :transport_api_version, :report_counters_as_deltas]

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
  field(:transport_api_version, 3, type: Envoy.Config.Core.V3.ApiVersion, enum: true)
  field(:report_counters_as_deltas, 2, type: Google.Protobuf.BoolValue)
end
