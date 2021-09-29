defmodule Envoy.Config.Listener.V3.ApiListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          api_listener: Google.Protobuf.Any.t() | nil
        }
  defstruct [:api_listener]

  field(:api_listener, 1, type: Google.Protobuf.Any)
end
