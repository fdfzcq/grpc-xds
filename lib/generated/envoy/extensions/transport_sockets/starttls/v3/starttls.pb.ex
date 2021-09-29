defmodule Envoy.Extensions.TransportSockets.Starttls.V3.StartTlsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cleartext_socket_config:
            Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer.t() | nil,
          tls_socket_config:
            Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.t() | nil
        }
  defstruct [:cleartext_socket_config, :tls_socket_config]

  field(:cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer
  )

  field(:tls_socket_config, 2, type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext)
end
