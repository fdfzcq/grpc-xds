defmodule Envoy.Config.Accesslog.V2.FileAccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          access_log_format: {atom, any},
          path: String.t()
        }
  defstruct [:access_log_format, :path]

  oneof(:access_log_format, 0)
  field(:path, 1, type: :string)
  field(:format, 2, type: :string, oneof: 0)
  field(:json_format, 3, type: Google.Protobuf.Struct, oneof: 0)
  field(:typed_json_format, 4, type: Google.Protobuf.Struct, oneof: 0)
end
