defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.GenericSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          secret: Envoy.Config.Core.V4alpha.DataSource.t() | nil
        }
  defstruct [:secret]

  field(:secret, 1, type: Envoy.Config.Core.V4alpha.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.SdsSecretConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          sds_config: Envoy.Config.Core.V4alpha.ConfigSource.t() | nil
        }
  defstruct [:name, :sds_config]

  field(:name, 1, type: :string)
  field(:sds_config, 2, type: Envoy.Config.Core.V4alpha.ConfigSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.Secret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any},
          name: String.t()
        }
  defstruct [:type, :name]

  oneof(:type, 0)
  field(:name, 1, type: :string)

  field(:tls_certificate, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsCertificate,
    oneof: 0
  )

  field(:session_ticket_keys, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsSessionTicketKeys,
    oneof: 0
  )

  field(:validation_context, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext,
    oneof: 0
  )

  field(:generic_secret, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.GenericSecret,
    oneof: 0
  )
end
