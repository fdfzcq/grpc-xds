defmodule Envoy.Config.Filter.Network.DirectResponse.V2.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [:response]

  field(:response, 1, type: Envoy.Api.V2.Core.DataSource)
end
