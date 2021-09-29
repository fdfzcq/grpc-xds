defmodule Envoy.Extensions.Filters.Http.Buffer.V3.Buffer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_request_bytes: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:max_request_bytes]

  field(:max_request_bytes, 1, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Extensions.Filters.Http.Buffer.V3.BufferPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override: {atom, any}
        }
  defstruct [:override]

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:buffer, 2, type: Envoy.Extensions.Filters.Http.Buffer.V3.Buffer, oneof: 0)
end
