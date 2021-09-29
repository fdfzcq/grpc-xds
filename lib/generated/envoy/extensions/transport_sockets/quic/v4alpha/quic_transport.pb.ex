defmodule Envoy.Extensions.TransportSockets.Quic.V4alpha.QuicDownstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          downstream_tls_context:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext.t() | nil
        }
  defstruct [:downstream_tls_context]

  field(:downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.DownstreamTlsContext
  )
end

defmodule Envoy.Extensions.TransportSockets.Quic.V4alpha.QuicUpstreamTransport do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upstream_tls_context:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.UpstreamTlsContext.t() | nil
        }
  defstruct [:upstream_tls_context]

  field(:upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.UpstreamTlsContext
  )
end
