defmodule Envoy.Data.Tap.V2alpha.TraceWrapper do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace: {atom, any}
        }
  defstruct [:trace]

  oneof(:trace, 0)
  field(:http_buffered_trace, 1, type: Envoy.Data.Tap.V2alpha.HttpBufferedTrace, oneof: 0)

  field(:http_streamed_trace_segment, 2,
    type: Envoy.Data.Tap.V2alpha.HttpStreamedTraceSegment,
    oneof: 0
  )

  field(:socket_buffered_trace, 3, type: Envoy.Data.Tap.V2alpha.SocketBufferedTrace, oneof: 0)

  field(:socket_streamed_trace_segment, 4,
    type: Envoy.Data.Tap.V2alpha.SocketStreamedTraceSegment,
    oneof: 0
  )
end
