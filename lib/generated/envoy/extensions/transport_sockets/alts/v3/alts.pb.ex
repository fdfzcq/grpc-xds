defmodule Envoy.Extensions.TransportSockets.Alts.V3.Alts do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          handshaker_service: String.t(),
          peer_service_accounts: [String.t()]
        }
  defstruct [:handshaker_service, :peer_service_accounts]

  field(:handshaker_service, 1, type: :string)
  field(:peer_service_accounts, 2, repeated: true, type: :string)
end
