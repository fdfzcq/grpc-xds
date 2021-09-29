defmodule Envoy.Api.V2.Auth.TlsParameters.TlsProtocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TLS_AUTO | :TLSv1_0 | :TLSv1_1 | :TLSv1_2 | :TLSv1_3

  field(:TLS_AUTO, 0)
  field(:TLSv1_0, 1)
  field(:TLSv1_1, 2)
  field(:TLSv1_2, 3)
  field(:TLSv1_3, 4)
end

defmodule Envoy.Api.V2.Auth.CertificateValidationContext.TrustChainVerification do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :VERIFY_TRUST_CHAIN | :ACCEPT_UNTRUSTED

  field(:VERIFY_TRUST_CHAIN, 0)
  field(:ACCEPT_UNTRUSTED, 1)
end

defmodule Envoy.Api.V2.Auth.TlsParameters do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tls_minimum_protocol_version: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol.t(),
          tls_maximum_protocol_version: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol.t(),
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
    type: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:tls_maximum_protocol_version, 2,
    type: Envoy.Api.V2.Auth.TlsParameters.TlsProtocol,
    enum: true
  )

  field(:cipher_suites, 3, repeated: true, type: :string)
  field(:ecdh_curves, 4, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Auth.PrivateKeyProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          provider_name: String.t()
        }
  defstruct [:config_type, :provider_name]

  oneof(:config_type, 0)
  field(:provider_name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Auth.TlsCertificate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          certificate_chain: Envoy.Api.V2.Core.DataSource.t() | nil,
          private_key: Envoy.Api.V2.Core.DataSource.t() | nil,
          private_key_provider: Envoy.Api.V2.Auth.PrivateKeyProvider.t() | nil,
          password: Envoy.Api.V2.Core.DataSource.t() | nil,
          ocsp_staple: Envoy.Api.V2.Core.DataSource.t() | nil,
          signed_certificate_timestamp: [Envoy.Api.V2.Core.DataSource.t()]
        }
  defstruct [
    :certificate_chain,
    :private_key,
    :private_key_provider,
    :password,
    :ocsp_staple,
    :signed_certificate_timestamp
  ]

  field(:certificate_chain, 1, type: Envoy.Api.V2.Core.DataSource)
  field(:private_key, 2, type: Envoy.Api.V2.Core.DataSource)
  field(:private_key_provider, 6, type: Envoy.Api.V2.Auth.PrivateKeyProvider)
  field(:password, 3, type: Envoy.Api.V2.Core.DataSource)
  field(:ocsp_staple, 4, type: Envoy.Api.V2.Core.DataSource)
  field(:signed_certificate_timestamp, 5, repeated: true, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Auth.TlsSessionTicketKeys do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          keys: [Envoy.Api.V2.Core.DataSource.t()]
        }
  defstruct [:keys]

  field(:keys, 1, repeated: true, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Auth.CertificateValidationContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trusted_ca: Envoy.Api.V2.Core.DataSource.t() | nil,
          verify_certificate_spki: [String.t()],
          verify_certificate_hash: [String.t()],
          verify_subject_alt_name: [String.t()],
          match_subject_alt_names: [Envoy.Type.Matcher.StringMatcher.t()],
          require_ocsp_staple: Google.Protobuf.BoolValue.t() | nil,
          require_signed_certificate_timestamp: Google.Protobuf.BoolValue.t() | nil,
          crl: Envoy.Api.V2.Core.DataSource.t() | nil,
          allow_expired_certificate: boolean,
          trust_chain_verification:
            Envoy.Api.V2.Auth.CertificateValidationContext.TrustChainVerification.t()
        }
  defstruct [
    :trusted_ca,
    :verify_certificate_spki,
    :verify_certificate_hash,
    :verify_subject_alt_name,
    :match_subject_alt_names,
    :require_ocsp_staple,
    :require_signed_certificate_timestamp,
    :crl,
    :allow_expired_certificate,
    :trust_chain_verification
  ]

  field(:trusted_ca, 1, type: Envoy.Api.V2.Core.DataSource)
  field(:verify_certificate_spki, 3, repeated: true, type: :string)
  field(:verify_certificate_hash, 2, repeated: true, type: :string)
  field(:verify_subject_alt_name, 4, repeated: true, type: :string, deprecated: true)
  field(:match_subject_alt_names, 9, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
  field(:require_ocsp_staple, 5, type: Google.Protobuf.BoolValue)
  field(:require_signed_certificate_timestamp, 6, type: Google.Protobuf.BoolValue)
  field(:crl, 7, type: Envoy.Api.V2.Core.DataSource)
  field(:allow_expired_certificate, 8, type: :bool)

  field(:trust_chain_verification, 10,
    type: Envoy.Api.V2.Auth.CertificateValidationContext.TrustChainVerification,
    enum: true
  )
end
