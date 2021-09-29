defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicDownstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          downstream_tls_context:
            Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.t() | nil
        }
  defstruct [:downstream_tls_context]

  field(:downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext
  )
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upstream_tls_context:
            Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext.t() | nil
        }
  defstruct [:upstream_tls_context]

  field(:upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext
  )
end
