defmodule Envoy.Extensions.AccessLoggers.File.V4alpha.FileAccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          access_log_format: {atom, any},
          path: String.t()
        }
  defstruct [:access_log_format, :path]

  oneof(:access_log_format, 0)
  field(:path, 1, type: :string)
  field(:log_format, 5, type: Envoy.Config.Core.V4alpha.SubstitutionFormatString, oneof: 0)
end
