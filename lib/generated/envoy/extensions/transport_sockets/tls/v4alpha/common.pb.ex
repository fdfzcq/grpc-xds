defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters.TlsProtocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TLS_AUTO | :TLSv1_0 | :TLSv1_1 | :TLSv1_2 | :TLSv1_3

  field(:TLS_AUTO, 0)
  field(:TLSv1_0, 1)
  field(:TLSv1_1, 2)
  field(:TLSv1_2, 3)
  field(:TLSv1_3, 4)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext.TrustChainVerification do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :VERIFY_TRUST_CHAIN | :ACCEPT_UNTRUSTED

  field(:VERIFY_TRUST_CHAIN, 0)
  field(:ACCEPT_UNTRUSTED, 1)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tls_minimum_protocol_version:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters.TlsProtocol.t(),
          tls_maximum_protocol_version:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters.TlsProtocol.t(),
          cipher_suites: [String.t()],
          ecdh_curves: [String.t()]
        }
  defstruct [
    :tls_minimum_protocol_version,
    :tls_maximum_protocol_version,
    :cipher_suites,
    :ecdh_curves
  ]

  field(:tls_minimum_protocol_version, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:tls_maximum_protocol_version, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:cipher_suites, 3, repeated: true, type: :string)
  field(:ecdh_curves, 4, repeated: true, type: :string)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.PrivateKeyProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          provider_name: String.t()
        }
  defstruct [:config_type, :provider_name]

  oneof(:config_type, 0)
  field(:provider_name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsCertificate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          certificate_chain: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          private_key: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          watched_directory: Envoy.Config.Core.V4alpha.WatchedDirectory.t() | nil,
          private_key_provider:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.PrivateKeyProvider.t() | nil,
          password: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          ocsp_staple: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          signed_certificate_timestamp: [Envoy.Config.Core.V4alpha.DataSource.t()]
        }
  defstruct [
    :certificate_chain,
    :private_key,
    :watched_directory,
    :private_key_provider,
    :password,
    :ocsp_staple,
    :signed_certificate_timestamp
  ]

  field(:certificate_chain, 1, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:private_key, 2, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:watched_directory, 7, type: Envoy.Config.Core.V4alpha.WatchedDirectory)

  field(:private_key_provider, 6,
    type: Envoy.Extensions.TransportSockets.Tls.V4alpha.PrivateKeyProvider
  )

  field(:password, 3, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:ocsp_staple, 4, type: Envoy.Config.Core.V4alpha.DataSource)

  field(:signed_certificate_timestamp, 5,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.DataSource
  )
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.TlsSessionTicketKeys do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          keys: [Envoy.Config.Core.V4alpha.DataSource.t()]
        }
  defstruct [:keys]

  field(:keys, 1, repeated: true, type: Envoy.Config.Core.V4alpha.DataSource)
end

defmodule Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trusted_ca: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          watched_directory: Envoy.Config.Core.V4alpha.WatchedDirectory.t() | nil,
          verify_certificate_spki: [String.t()],
          verify_certificate_hash: [String.t()],
          match_subject_alt_names: [Envoy.Type.Matcher.V4alpha.StringMatcher.t()],
          require_signed_certificate_timestamp: Google.Protobuf.BoolValue.t() | nil,
          crl: Envoy.Config.Core.V4alpha.DataSource.t() | nil,
          allow_expired_certificate: boolean,
          trust_chain_verification:
            Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext.TrustChainVerification.t(),
          custom_validator_config: Envoy.Config.Core.V4alpha.TypedExtensionConfig.t() | nil
        }
  defstruct [
    :trusted_ca,
    :watched_directory,
    :verify_certificate_spki,
    :verify_certificate_hash,
    :match_subject_alt_names,
    :require_signed_certificate_timestamp,
    :crl,
    :allow_expired_certificate,
    :trust_chain_verification,
    :custom_validator_config
  ]

  field(:trusted_ca, 1, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:watched_directory, 11, type: Envoy.Config.Core.V4alpha.WatchedDirectory)
  field(:verify_certificate_spki, 3, repeated: true, type: :string)
  field(:verify_certificate_hash, 2, repeated: true, type: :string)

  field(:match_subject_alt_names, 9,
    repeated: true,
    type: Envoy.Type.Matcher.V4alpha.StringMatcher
  )

  field(:require_signed_certificate_timestamp, 6, type: Google.Protobuf.BoolValue)
  field(:crl, 7, type: Envoy.Config.Core.V4alpha.DataSource)
  field(:allow_expired_certificate, 8, type: :bool)

  field(:trust_chain_verification, 10,
    type:
      Envoy.Extensions.TransportSockets.Tls.V4alpha.CertificateValidationContext.TrustChainVerification,
    enum: true
  )

  field(:custom_validator_config, 12, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
end
