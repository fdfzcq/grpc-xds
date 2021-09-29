defmodule Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig.TraceContext do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NONE | :TRACE_CONTEXT | :GRPC_TRACE_BIN | :CLOUD_TRACE_CONTEXT | :B3

  field(:NONE, 0)
  field(:TRACE_CONTEXT, 1)
  field(:GRPC_TRACE_BIN, 2)
  field(:CLOUD_TRACE_CONTEXT, 3)
  field(:B3, 4)
end

defmodule Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace_config: Opencensus.Proto.Trace.V1.TraceConfig.t() | nil,
          stdout_exporter_enabled: boolean,
          stackdriver_exporter_enabled: boolean,
          stackdriver_project_id: String.t(),
          stackdriver_address: String.t(),
          stackdriver_grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil,
          ocagent_exporter_enabled: boolean,
          ocagent_address: String.t(),
          ocagent_grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil,
          incoming_trace_context: [
            [Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig.TraceContext.t()]
          ],
          outgoing_trace_context: [
            [Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig.TraceContext.t()]
          ]
        }
  defstruct [
    :trace_config,
    :stdout_exporter_enabled,
    :stackdriver_exporter_enabled,
    :stackdriver_project_id,
    :stackdriver_address,
    :stackdriver_grpc_service,
    :ocagent_exporter_enabled,
    :ocagent_address,
    :ocagent_grpc_service,
    :incoming_trace_context,
    :outgoing_trace_context
  ]

  field(:trace_config, 1, type: Opencensus.Proto.Trace.V1.TraceConfig)
  field(:stdout_exporter_enabled, 2, type: :bool)
  field(:stackdriver_exporter_enabled, 3, type: :bool)
  field(:stackdriver_project_id, 4, type: :string)
  field(:stackdriver_address, 10, type: :string)
  field(:stackdriver_grpc_service, 13, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:ocagent_exporter_enabled, 11, type: :bool)
  field(:ocagent_address, 12, type: :string)
  field(:ocagent_grpc_service, 14, type: Envoy.Config.Core.V4alpha.GrpcService)

  field(:incoming_trace_context, 8,
    repeated: true,
    type: Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig.TraceContext,
    enum: true
  )

  field(:outgoing_trace_context, 9,
    repeated: true,
    type: Envoy.Extensions.Tracers.Opencensus.V4alpha.OpenCensusConfig.TraceContext,
    enum: true
  )
end
