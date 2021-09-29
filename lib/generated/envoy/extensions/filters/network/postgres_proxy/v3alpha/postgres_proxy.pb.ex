defmodule Envoy.Extensions.Filters.Network.PostgresProxy.V3alpha.PostgresProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          enable_sql_parsing: Google.Protobuf.BoolValue.t() | nil,
          terminate_ssl: boolean
        }
  defstruct [:stat_prefix, :enable_sql_parsing, :terminate_ssl]

  field(:stat_prefix, 1, type: :string)
  field(:enable_sql_parsing, 2, type: Google.Protobuf.BoolValue)
  field(:terminate_ssl, 3, type: :bool)
end
