defmodule Envoy.Extensions.Filters.Network.DirectResponse.V3.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [:response]

  field(:response, 1, type: Envoy.Config.Core.V3.DataSource)
end
