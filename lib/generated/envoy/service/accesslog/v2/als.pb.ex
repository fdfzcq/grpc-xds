defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Api.V2.Core.Node.t() | nil,
          log_name: String.t()
        }
  defstruct [:node, :log_name]

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:log_name, 2, type: :string)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          log_entry: [Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.t()]
        }
  defstruct [:log_entry]

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          log_entry: [Envoy.Data.Accesslog.V2.TCPAccessLogEntry.t()]
        }
  defstruct [:log_entry]

  field(:log_entry, 1, repeated: true, type: Envoy.Data.Accesslog.V2.TCPAccessLogEntry)
end

defmodule Envoy.Service.Accesslog.V2.StreamAccessLogsMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          log_entries: {atom, any},
          identifier: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier.t() | nil
        }
  defstruct [:log_entries, :identifier]

  oneof(:log_entries, 0)
  field(:identifier, 1, type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.Identifier)

  field(:http_logs, 2,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.HTTPAccessLogEntries,
    oneof: 0
  )

  field(:tcp_logs, 3,
    type: Envoy.Service.Accesslog.V2.StreamAccessLogsMessage.TCPAccessLogEntries,
    oneof: 0
  )
end
