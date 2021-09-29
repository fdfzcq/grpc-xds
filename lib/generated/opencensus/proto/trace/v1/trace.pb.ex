defmodule Opencensus.Proto.Trace.V1.Span.SpanKind do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SPAN_KIND_UNSPECIFIED | :SERVER | :CLIENT

  field(:SPAN_KIND_UNSPECIFIED, 0)
  field(:SERVER, 1)
  field(:CLIENT, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TYPE_UNSPECIFIED | :SENT | :RECEIVED

  field(:TYPE_UNSPECIFIED, 0)
  field(:SENT, 1)
  field(:RECEIVED, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.Link.Type do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TYPE_UNSPECIFIED | :CHILD_LINKED_SPAN | :PARENT_LINKED_SPAN

  field(:TYPE_UNSPECIFIED, 0)
  field(:CHILD_LINKED_SPAN, 1)
  field(:PARENT_LINKED_SPAN, 2)
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          entries: [Opencensus.Proto.Trace.V1.Span.Tracestate.Entry.t()]
        }
  defstruct [:entries]

  field(:entries, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Tracestate.Entry)
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Opencensus.Proto.Trace.V1.AttributeValue.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Opencensus.Proto.Trace.V1.AttributeValue)
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          attribute_map: %{String.t() => Opencensus.Proto.Trace.V1.AttributeValue.t() | nil},
          dropped_attributes_count: integer
        }
  defstruct [:attribute_map, :dropped_attributes_count]

  field(:attribute_map, 1,
    repeated: true,
    type: Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry,
    map: true
  )

  field(:dropped_attributes_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          description: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          attributes: Opencensus.Proto.Trace.V1.Span.Attributes.t() | nil
        }
  defstruct [:description, :attributes]

  field(:description, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:attributes, 2, type: Opencensus.Proto.Trace.V1.Span.Attributes)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type.t(),
          id: non_neg_integer,
          uncompressed_size: non_neg_integer,
          compressed_size: non_neg_integer
        }
  defstruct [:type, :id, :uncompressed_size, :compressed_size]

  field(:type, 1, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type, enum: true)
  field(:id, 2, type: :uint64)
  field(:uncompressed_size, 3, type: :uint64)
  field(:compressed_size, 4, type: :uint64)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: {atom, any},
          time: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:value, :time]

  oneof(:value, 0)
  field(:time, 1, type: Google.Protobuf.Timestamp)
  field(:annotation, 2, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation, oneof: 0)
  field(:message_event, 3, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent, oneof: 0)
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvents do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          time_event: [Opencensus.Proto.Trace.V1.Span.TimeEvent.t()],
          dropped_annotations_count: integer,
          dropped_message_events_count: integer
        }
  defstruct [:time_event, :dropped_annotations_count, :dropped_message_events_count]

  field(:time_event, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.TimeEvent)
  field(:dropped_annotations_count, 2, type: :int32)
  field(:dropped_message_events_count, 3, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span.Link do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace_id: binary,
          span_id: binary,
          type: Opencensus.Proto.Trace.V1.Span.Link.Type.t(),
          attributes: Opencensus.Proto.Trace.V1.Span.Attributes.t() | nil,
          tracestate: Opencensus.Proto.Trace.V1.Span.Tracestate.t() | nil
        }
  defstruct [:trace_id, :span_id, :type, :attributes, :tracestate]

  field(:trace_id, 1, type: :bytes)
  field(:span_id, 2, type: :bytes)
  field(:type, 3, type: Opencensus.Proto.Trace.V1.Span.Link.Type, enum: true)
  field(:attributes, 4, type: Opencensus.Proto.Trace.V1.Span.Attributes)
  field(:tracestate, 5, type: Opencensus.Proto.Trace.V1.Span.Tracestate)
end

defmodule Opencensus.Proto.Trace.V1.Span.Links do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          link: [Opencensus.Proto.Trace.V1.Span.Link.t()],
          dropped_links_count: integer
        }
  defstruct [:link, :dropped_links_count]

  field(:link, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Link)
  field(:dropped_links_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.Span do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace_id: binary,
          span_id: binary,
          tracestate: Opencensus.Proto.Trace.V1.Span.Tracestate.t() | nil,
          parent_span_id: binary,
          name: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          kind: Opencensus.Proto.Trace.V1.Span.SpanKind.t(),
          start_time: Google.Protobuf.Timestamp.t() | nil,
          end_time: Google.Protobuf.Timestamp.t() | nil,
          attributes: Opencensus.Proto.Trace.V1.Span.Attributes.t() | nil,
          stack_trace: Opencensus.Proto.Trace.V1.StackTrace.t() | nil,
          time_events: Opencensus.Proto.Trace.V1.Span.TimeEvents.t() | nil,
          links: Opencensus.Proto.Trace.V1.Span.Links.t() | nil,
          status: Opencensus.Proto.Trace.V1.Status.t() | nil,
          resource: Opencensus.Proto.Resource.V1.Resource.t() | nil,
          same_process_as_parent_span: Google.Protobuf.BoolValue.t() | nil,
          child_span_count: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :trace_id,
    :span_id,
    :tracestate,
    :parent_span_id,
    :name,
    :kind,
    :start_time,
    :end_time,
    :attributes,
    :stack_trace,
    :time_events,
    :links,
    :status,
    :resource,
    :same_process_as_parent_span,
    :child_span_count
  ]

  field(:trace_id, 1, type: :bytes)
  field(:span_id, 2, type: :bytes)
  field(:tracestate, 15, type: Opencensus.Proto.Trace.V1.Span.Tracestate)
  field(:parent_span_id, 3, type: :bytes)
  field(:name, 4, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:kind, 14, type: Opencensus.Proto.Trace.V1.Span.SpanKind, enum: true)
  field(:start_time, 5, type: Google.Protobuf.Timestamp)
  field(:end_time, 6, type: Google.Protobuf.Timestamp)
  field(:attributes, 7, type: Opencensus.Proto.Trace.V1.Span.Attributes)
  field(:stack_trace, 8, type: Opencensus.Proto.Trace.V1.StackTrace)
  field(:time_events, 9, type: Opencensus.Proto.Trace.V1.Span.TimeEvents)
  field(:links, 10, type: Opencensus.Proto.Trace.V1.Span.Links)
  field(:status, 11, type: Opencensus.Proto.Trace.V1.Status)
  field(:resource, 16, type: Opencensus.Proto.Resource.V1.Resource)
  field(:same_process_as_parent_span, 12, type: Google.Protobuf.BoolValue)
  field(:child_span_count, 13, type: Google.Protobuf.UInt32Value)
end

defmodule Opencensus.Proto.Trace.V1.Status do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: integer,
          message: String.t()
        }
  defstruct [:code, :message]

  field(:code, 1, type: :int32)
  field(:message, 2, type: :string)
end

defmodule Opencensus.Proto.Trace.V1.AttributeValue do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: {atom, any}
        }
  defstruct [:value]

  oneof(:value, 0)
  field(:string_value, 1, type: Opencensus.Proto.Trace.V1.TruncatableString, oneof: 0)
  field(:int_value, 2, type: :int64, oneof: 0)
  field(:bool_value, 3, type: :bool, oneof: 0)
  field(:double_value, 4, type: :double, oneof: 0)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrame do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          function_name: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          original_function_name: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          file_name: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          line_number: integer,
          column_number: integer,
          load_module: Opencensus.Proto.Trace.V1.Module.t() | nil,
          source_version: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil
        }
  defstruct [
    :function_name,
    :original_function_name,
    :file_name,
    :line_number,
    :column_number,
    :load_module,
    :source_version
  ]

  field(:function_name, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:original_function_name, 2, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:file_name, 3, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:line_number, 4, type: :int64)
  field(:column_number, 5, type: :int64)
  field(:load_module, 6, type: Opencensus.Proto.Trace.V1.Module)
  field(:source_version, 7, type: Opencensus.Proto.Trace.V1.TruncatableString)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrames do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          frame: [Opencensus.Proto.Trace.V1.StackTrace.StackFrame.t()],
          dropped_frames_count: integer
        }
  defstruct [:frame, :dropped_frames_count]

  field(:frame, 1, repeated: true, type: Opencensus.Proto.Trace.V1.StackTrace.StackFrame)
  field(:dropped_frames_count, 2, type: :int32)
end

defmodule Opencensus.Proto.Trace.V1.StackTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stack_frames: Opencensus.Proto.Trace.V1.StackTrace.StackFrames.t() | nil,
          stack_trace_hash_id: non_neg_integer
        }
  defstruct [:stack_frames, :stack_trace_hash_id]

  field(:stack_frames, 1, type: Opencensus.Proto.Trace.V1.StackTrace.StackFrames)
  field(:stack_trace_hash_id, 2, type: :uint64)
end

defmodule Opencensus.Proto.Trace.V1.Module do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          module: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil,
          build_id: Opencensus.Proto.Trace.V1.TruncatableString.t() | nil
        }
  defstruct [:module, :build_id]

  field(:module, 1, type: Opencensus.Proto.Trace.V1.TruncatableString)
  field(:build_id, 2, type: Opencensus.Proto.Trace.V1.TruncatableString)
end

defmodule Opencensus.Proto.Trace.V1.TruncatableString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: String.t(),
          truncated_byte_count: integer
        }
  defstruct [:value, :truncated_byte_count]

  field(:value, 1, type: :string)
  field(:truncated_byte_count, 2, type: :int32)
end
