defmodule Envoy.Extensions.Filters.Network.KafkaBroker.V3.KafkaBroker do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t()
        }
  defstruct [:stat_prefix]

  field(:stat_prefix, 1, type: :string)
end
