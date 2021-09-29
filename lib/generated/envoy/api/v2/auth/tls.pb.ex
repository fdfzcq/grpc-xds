defmodule Envoy.Api.V2.Auth.UpstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_tls_context: Envoy.Api.V2.Auth.CommonTlsContext.t() | nil,
          sni: String.t(),
          allow_renegotiation: boolean,
          max_session_keys: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:common_tls_context, :sni, :allow_renegotiation, :max_session_keys]

  field(:common_tls_context, 1, type: Envoy.Api.V2.Auth.CommonTlsContext)
  field(:sni, 2, type: :string)
  field(:allow_renegotiation, 3, type: :bool)
  field(:max_session_keys, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Auth.DownstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          session_ticket_keys_type: {atom, any},
          common_tls_context: Envoy.Api.V2.Auth.CommonTlsContext.t() | nil,
          require_client_certificate: Google.Protobuf.BoolValue.t() | nil,
          require_sni: Google.Protobuf.BoolValue.t() | nil,
          session_timeout: Google.Protobuf.Duration.t() | nil
        }
  defstruct [
    :session_ticket_keys_type,
    :common_tls_context,
    :require_client_certificate,
    :require_sni,
    :session_timeout
  ]

  oneof(:session_ticket_keys_type, 0)
  field(:common_tls_context, 1, type: Envoy.Api.V2.Auth.CommonTlsContext)
  field(:require_client_certificate, 2, type: Google.Protobuf.BoolValue)
  field(:require_sni, 3, type: Google.Protobuf.BoolValue)
  field(:session_ticket_keys, 4, type: Envoy.Api.V2.Auth.TlsSessionTicketKeys, oneof: 0)

  field(:session_ticket_keys_sds_secret_config, 5,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    oneof: 0
  )

  field(:disable_stateless_session_resumption, 7, type: :bool, oneof: 0)
  field(:session_timeout, 6, type: Google.Protobuf.Duration)
end

defmodule Envoy.Api.V2.Auth.CommonTlsContext.CombinedCertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_validation_context: Envoy.Api.V2.Auth.CertificateValidationContext.t() | nil,
          validation_context_sds_secret_config: Envoy.Api.V2.Auth.SdsSecretConfig.t() | nil
        }
  defstruct [:default_validation_context, :validation_context_sds_secret_config]

  field(:default_validation_context, 1, type: Envoy.Api.V2.Auth.CertificateValidationContext)
  field(:validation_context_sds_secret_config, 2, type: Envoy.Api.V2.Auth.SdsSecretConfig)
end

defmodule Envoy.Api.V2.Auth.CommonTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          validation_context_type: {atom, any},
          tls_params: Envoy.Api.V2.Auth.TlsParameters.t() | nil,
          tls_certificates: [Envoy.Api.V2.Auth.TlsCertificate.t()],
          tls_certificate_sds_secret_configs: [Envoy.Api.V2.Auth.SdsSecretConfig.t()],
          alpn_protocols: [String.t()]
        }
  defstruct [
    :validation_context_type,
    :tls_params,
    :tls_certificates,
    :tls_certificate_sds_secret_configs,
    :alpn_protocols
  ]

  oneof(:validation_context_type, 0)
  field(:tls_params, 1, type: Envoy.Api.V2.Auth.TlsParameters)
  field(:tls_certificates, 2, repeated: true, type: Envoy.Api.V2.Auth.TlsCertificate)

  field(:tls_certificate_sds_secret_configs, 6,
    repeated: true,
    type: Envoy.Api.V2.Auth.SdsSecretConfig
  )

  field(:validation_context, 3, type: Envoy.Api.V2.Auth.CertificateValidationContext, oneof: 0)

  field(:validation_context_sds_secret_config, 7,
    type: Envoy.Api.V2.Auth.SdsSecretConfig,
    oneof: 0
  )

  field(:combined_validation_context, 8,
    type: Envoy.Api.V2.Auth.CommonTlsContext.CombinedCertificateValidationContext,
    oneof: 0
  )

  field(:alpn_protocols, 4, repeated: true, type: :string)
end
