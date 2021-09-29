defmodule Envoy.Api.V2.Auth.GenericSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          secret: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [:secret]

  field(:secret, 1, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Auth.SdsSecretConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          sds_config: Envoy.Api.V2.Core.ConfigSource.t() | nil
        }
  defstruct [:name, :sds_config]

  field(:name, 1, type: :string)
  field(:sds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
end

defmodule Envoy.Api.V2.Auth.Secret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any},
          name: String.t()
        }
  defstruct [:type, :name]

  oneof(:type, 0)
  field(:name, 1, type: :string)
  field(:tls_certificate, 2, type: Envoy.Api.V2.Auth.TlsCertificate, oneof: 0)
  field(:session_ticket_keys, 3, type: Envoy.Api.V2.Auth.TlsSessionTicketKeys, oneof: 0)
  field(:validation_context, 4, type: Envoy.Api.V2.Auth.CertificateValidationContext, oneof: 0)
  field(:generic_secret, 5, type: Envoy.Api.V2.Auth.GenericSecret, oneof: 0)
end
