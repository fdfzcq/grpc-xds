defmodule Envoy.Config.Core.V3.GrpcService.EnvoyGrpc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          authority: String.t()
        }
  defstruct [:cluster_name, :authority]

  field(:cluster_name, 1, type: :string)
  field(:authority, 2, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          root_certs: Envoy.Config.Core.V3.DataSource.t() | nil,
          private_key: Envoy.Config.Core.V3.DataSource.t() | nil,
          cert_chain: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [:root_certs, :private_key, :cert_chain]

  field(:root_certs, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:private_key, 2, type: Envoy.Config.Core.V3.DataSource)
  field(:cert_chain, 3, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          credential_specifier: {atom, any}
        }
  defstruct [:credential_specifier]

  oneof(:credential_specifier, 0)

  field(:ssl_credentials, 1,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials,
    oneof: 0
  )

  field(:google_default, 2, type: Google.Protobuf.Empty, oneof: 0)

  field(:local_credentials, 3,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          json_key: String.t(),
          token_lifetime_seconds: non_neg_integer
        }
  defstruct [:json_key, :token_lifetime_seconds]

  field(:json_key, 1, type: :string)
  field(:token_lifetime_seconds, 2, type: :uint64)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          authorization_token: String.t(),
          authority_selector: String.t()
        }
  defstruct [:authorization_token, :authority_selector]

  field(:authorization_token, 1, type: :string)
  field(:authority_selector, 2, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          token_exchange_service_uri: String.t(),
          resource: String.t(),
          audience: String.t(),
          scope: String.t(),
          requested_token_type: String.t(),
          subject_token_path: String.t(),
          subject_token_type: String.t(),
          actor_token_path: String.t(),
          actor_token_type: String.t()
        }
  defstruct [
    :token_exchange_service_uri,
    :resource,
    :audience,
    :scope,
    :requested_token_type,
    :subject_token_path,
    :subject_token_type,
    :actor_token_path,
    :actor_token_type
  ]

  field(:token_exchange_service_uri, 1, type: :string)
  field(:resource, 2, type: :string)
  field(:audience, 3, type: :string)
  field(:scope, 4, type: :string)
  field(:requested_token_type, 5, type: :string)
  field(:subject_token_path, 6, type: :string)
  field(:subject_token_type, 7, type: :string)
  field(:actor_token_path, 8, type: :string)
  field(:actor_token_type, 9, type: :string)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          credential_specifier: {atom, any}
        }
  defstruct [:credential_specifier]

  oneof(:credential_specifier, 0)
  field(:access_token, 1, type: :string, oneof: 0)
  field(:google_compute_engine, 2, type: Google.Protobuf.Empty, oneof: 0)
  field(:google_refresh_token, 3, type: :string, oneof: 0)

  field(:service_account_jwt_access, 4,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials,
    oneof: 0
  )

  field(:google_iam, 5,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials,
    oneof: 0
  )

  field(:from_plugin, 6,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin,
    oneof: 0
  )

  field(:sts_service, 7,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService,
    oneof: 0
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value_specifier: {atom, any}
        }
  defstruct [:value_specifier]

  oneof(:value_specifier, 0)
  field(:string_value, 1, type: :string, oneof: 0)
  field(:int_value, 2, type: :int64, oneof: 0)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value)
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          args: %{
            String.t() => Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value.t() | nil
          }
        }
  defstruct [:args]

  field(:args, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry,
    map: true
  )
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          target_uri: String.t(),
          channel_credentials:
            Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials.t() | nil,
          call_credentials: [Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.t()],
          stat_prefix: String.t(),
          credentials_factory_name: String.t(),
          config: Google.Protobuf.Struct.t() | nil,
          per_stream_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil,
          channel_args: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.t() | nil
        }
  defstruct [
    :target_uri,
    :channel_credentials,
    :call_credentials,
    :stat_prefix,
    :credentials_factory_name,
    :config,
    :per_stream_buffer_limit_bytes,
    :channel_args
  ]

  field(:target_uri, 1, type: :string)

  field(:channel_credentials, 2,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials
  )

  field(:call_credentials, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials
  )

  field(:stat_prefix, 4, type: :string)
  field(:credentials_factory_name, 5, type: :string)
  field(:config, 6, type: Google.Protobuf.Struct)
  field(:per_stream_buffer_limit_bytes, 7, type: Google.Protobuf.UInt32Value)
  field(:channel_args, 8, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs)
end

defmodule Envoy.Config.Core.V3.GrpcService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          target_specifier: {atom, any},
          timeout: Google.Protobuf.Duration.t() | nil,
          initial_metadata: [Envoy.Config.Core.V3.HeaderValue.t()]
        }
  defstruct [:target_specifier, :timeout, :initial_metadata]

  oneof(:target_specifier, 0)
  field(:envoy_grpc, 1, type: Envoy.Config.Core.V3.GrpcService.EnvoyGrpc, oneof: 0)
  field(:google_grpc, 2, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc, oneof: 0)
  field(:timeout, 3, type: Google.Protobuf.Duration)
  field(:initial_metadata, 5, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
end
