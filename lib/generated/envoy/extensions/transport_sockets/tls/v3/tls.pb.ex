defmodule Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.OcspStaplePolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :LENIENT_STAPLING | :STRICT_STAPLING | :MUST_STAPLE

  field(:LENIENT_STAPLING, 0)
  field(:STRICT_STAPLING, 1)
  field(:MUST_STAPLE, 2)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_tls_context: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.t() | nil,
          sni: String.t(),
          allow_renegotiation: boolean,
          max_session_keys: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:common_tls_context, :sni, :allow_renegotiation, :max_session_keys]

  field(:common_tls_context, 1, type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext)
  field(:sni, 2, type: :string)
  field(:allow_renegotiation, 3, type: :bool)
  field(:max_session_keys, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          session_ticket_keys_type: {atom, any},
          common_tls_context: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.t() | nil,
          require_client_certificate: Google.Protobuf.BoolValue.t() | nil,
          require_sni: Google.Protobuf.BoolValue.t() | nil,
          session_timeout: Google.Protobuf.Duration.t() | nil,
          ocsp_staple_policy:
            Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.OcspStaplePolicy.t()
        }
  defstruct [
    :session_ticket_keys_type,
    :common_tls_context,
    :require_client_certificate,
    :require_sni,
    :session_timeout,
    :ocsp_staple_policy
  ]

  oneof(:session_ticket_keys_type, 0)
  field(:common_tls_context, 1, type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext)
  field(:require_client_certificate, 2, type: Google.Protobuf.BoolValue)
  field(:require_sni, 3, type: Google.Protobuf.BoolValue)

  field(:session_ticket_keys, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys,
    oneof: 0
  )

  field(:session_ticket_keys_sds_secret_config, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    oneof: 0
  )

  field(:disable_stateless_session_resumption, 7, type: :bool, oneof: 0)
  field(:session_timeout, 6, type: Google.Protobuf.Duration)

  field(:ocsp_staple_policy, 8,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.OcspStaplePolicy,
    enum: true
  )
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: {atom, any},
          name: String.t()
        }
  defstruct [:config, :name]

  oneof(:config, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          instance_name: String.t(),
          certificate_name: String.t()
        }
  defstruct [:instance_name, :certificate_name]

  field(:instance_name, 1, type: :string)
  field(:certificate_name, 2, type: :string)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CombinedCertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_validation_context:
            Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext.t() | nil,
          validation_context_sds_secret_config:
            Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig.t() | nil,
          validation_context_certificate_provider:
            Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider.t()
            | nil,
          validation_context_certificate_provider_instance:
            Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance.t()
            | nil
        }
  defstruct [
    :default_validation_context,
    :validation_context_sds_secret_config,
    :validation_context_certificate_provider,
    :validation_context_certificate_provider_instance
  ]

  field(:default_validation_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext
  )

  field(:validation_context_sds_secret_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig
  )

  field(:validation_context_certificate_provider, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider
  )

  field(:validation_context_certificate_provider_instance, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance
  )
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          validation_context_type: {atom, any},
          tls_params: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters.t() | nil,
          tls_certificates: [Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate.t()],
          tls_certificate_sds_secret_configs: [
            Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig.t()
          ],
          tls_certificate_certificate_provider:
            Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider.t()
            | nil,
          tls_certificate_certificate_provider_instance:
            Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance.t()
            | nil,
          alpn_protocols: [String.t()],
          custom_handshaker: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil
        }
  defstruct [
    :validation_context_type,
    :tls_params,
    :tls_certificates,
    :tls_certificate_sds_secret_configs,
    :tls_certificate_certificate_provider,
    :tls_certificate_certificate_provider_instance,
    :alpn_protocols,
    :custom_handshaker
  ]

  oneof(:validation_context_type, 0)
  field(:tls_params, 1, type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters)

  field(:tls_certificates, 2,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate
  )

  field(:tls_certificate_sds_secret_configs, 6,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig
  )

  field(:tls_certificate_certificate_provider, 9,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider
  )

  field(:tls_certificate_certificate_provider_instance, 11,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance
  )

  field(:validation_context, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    oneof: 0
  )

  field(:validation_context_sds_secret_config, 7,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    oneof: 0
  )

  field(:combined_validation_context, 8,
    type:
      Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CombinedCertificateValidationContext,
    oneof: 0
  )

  field(:validation_context_certificate_provider, 10,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider,
    oneof: 0
  )

  field(:validation_context_certificate_provider_instance, 12,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    oneof: 0
  )

  field(:alpn_protocols, 4, repeated: true, type: :string)
  field(:custom_handshaker, 13, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end
