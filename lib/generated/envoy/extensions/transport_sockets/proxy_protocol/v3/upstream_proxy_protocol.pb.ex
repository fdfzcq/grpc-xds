defmodule Envoy.Extensions.TransportSockets.ProxyProtocol.V3.ProxyProtocolUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Envoy.Config.Core.V3.ProxyProtocolConfig.t() | nil,
          transport_socket: Envoy.Config.Core.V3.TransportSocket.t() | nil
        }
  defstruct [:config, :transport_socket]

  field(:config, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig)
  field(:transport_socket, 2, type: Envoy.Config.Core.V3.TransportSocket)
end
