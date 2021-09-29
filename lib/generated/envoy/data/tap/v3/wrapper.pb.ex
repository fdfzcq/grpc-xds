defmodule Envoy.Data.Tap.V3.TraceWrapper do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace: {atom, any}
        }
  defstruct [:trace]

  oneof(:trace, 0)
  field(:http_buffered_trace, 1, type: Envoy.Data.Tap.V3.HttpBufferedTrace, oneof: 0)

  field(:http_streamed_trace_segment, 2,
    type: Envoy.Data.Tap.V3.HttpStreamedTraceSegment,
    oneof: 0
  )

  field(:socket_buffered_trace, 3, type: Envoy.Data.Tap.V3.SocketBufferedTrace, oneof: 0)

  field(:socket_streamed_trace_segment, 4,
    type: Envoy.Data.Tap.V3.SocketStreamedTraceSegment,
    oneof: 0
  )
end
