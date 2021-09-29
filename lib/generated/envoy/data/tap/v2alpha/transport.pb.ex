defmodule Envoy.Data.Tap.V2alpha.Connection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          local_address: Envoy.Api.V2.Core.Address.t() | nil,
          remote_address: Envoy.Api.V2.Core.Address.t() | nil
        }
  defstruct [:local_address, :remote_address]

  field(:local_address, 2, type: Envoy.Api.V2.Core.Address)
  field(:remote_address, 3, type: Envoy.Api.V2.Core.Address)
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Read do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          data: Envoy.Data.Tap.V2alpha.Body.t() | nil
        }
  defstruct [:data]

  field(:data, 1, type: Envoy.Data.Tap.V2alpha.Body)
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Write do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          data: Envoy.Data.Tap.V2alpha.Body.t() | nil,
          end_stream: boolean
        }
  defstruct [:data, :end_stream]

  field(:data, 1, type: Envoy.Data.Tap.V2alpha.Body)
  field(:end_stream, 2, type: :bool)
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent.Closed do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Data.Tap.V2alpha.SocketEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event_selector: {atom, any},
          timestamp: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:event_selector, :timestamp]

  oneof(:event_selector, 0)
  field(:timestamp, 1, type: Google.Protobuf.Timestamp)
  field(:read, 2, type: Envoy.Data.Tap.V2alpha.SocketEvent.Read, oneof: 0)
  field(:write, 3, type: Envoy.Data.Tap.V2alpha.SocketEvent.Write, oneof: 0)
  field(:closed, 4, type: Envoy.Data.Tap.V2alpha.SocketEvent.Closed, oneof: 0)
end

defmodule Envoy.Data.Tap.V2alpha.SocketBufferedTrace do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trace_id: non_neg_integer,
          connection: Envoy.Data.Tap.V2alpha.Connection.t() | nil,
          events: [Envoy.Data.Tap.V2alpha.SocketEvent.t()],
          read_truncated: boolean,
          write_truncated: boolean
        }
  defstruct [:trace_id, :connection, :events, :read_truncated, :write_truncated]

  field(:trace_id, 1, type: :uint64)
  field(:connection, 2, type: Envoy.Data.Tap.V2alpha.Connection)
  field(:events, 3, repeated: true, type: Envoy.Data.Tap.V2alpha.SocketEvent)
  field(:read_truncated, 4, type: :bool)
  field(:write_truncated, 5, type: :bool)
end

defmodule Envoy.Data.Tap.V2alpha.SocketStreamedTraceSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          message_piece: {atom, any},
          trace_id: non_neg_integer
        }
  defstruct [:message_piece, :trace_id]

  oneof(:message_piece, 0)
  field(:trace_id, 1, type: :uint64)
  field(:connection, 2, type: Envoy.Data.Tap.V2alpha.Connection, oneof: 0)
  field(:event, 3, type: Envoy.Data.Tap.V2alpha.SocketEvent, oneof: 0)
end
