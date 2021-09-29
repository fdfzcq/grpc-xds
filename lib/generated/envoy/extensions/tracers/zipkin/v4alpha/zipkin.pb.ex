defmodule Envoy.Extensions.Tracers.Zipkin.V4alpha.ZipkinConfig.CollectorEndpointVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE | :HTTP_JSON | :HTTP_PROTO | :GRPC

  field(:DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0)
  field(:HTTP_JSON, 1)
  field(:HTTP_PROTO, 2)
  field(:GRPC, 3)
end

defmodule Envoy.Extensions.Tracers.Zipkin.V4alpha.ZipkinConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          collector_cluster: String.t(),
          collector_endpoint: String.t(),
          trace_id_128bit: boolean,
          shared_span_context: Google.Protobuf.BoolValue.t() | nil,
          collector_endpoint_version:
            Envoy.Extensions.Tracers.Zipkin.V4alpha.ZipkinConfig.CollectorEndpointVersion.t(),
          collector_hostname: String.t()
        }
  defstruct [
    :collector_cluster,
    :collector_endpoint,
    :trace_id_128bit,
    :shared_span_context,
    :collector_endpoint_version,
    :collector_hostname
  ]

  field(:collector_cluster, 1, type: :string)
  field(:collector_endpoint, 2, type: :string)
  field(:trace_id_128bit, 3, type: :bool)
  field(:shared_span_context, 4, type: Google.Protobuf.BoolValue)

  field(:collector_endpoint_version, 5,
    type: Envoy.Extensions.Tracers.Zipkin.V4alpha.ZipkinConfig.CollectorEndpointVersion,
    enum: true
  )

  field(:collector_hostname, 6, type: :string)
end
