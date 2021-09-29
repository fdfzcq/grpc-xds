defmodule Envoy.Extensions.TransportSockets.Tap.V3.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig.t() | nil,
          transport_socket: Envoy.Config.Core.V3.TransportSocket.t() | nil
        }
  defstruct [:common_config, :transport_socket]

  field(:common_config, 1, type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig)
  field(:transport_socket, 2, type: Envoy.Config.Core.V3.TransportSocket)
end
