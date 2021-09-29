defmodule Envoy.Extensions.Filters.Network.MysqlProxy.V3.MySQLProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          access_log: String.t()
        }
  defstruct [:stat_prefix, :access_log]

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
end
