defmodule Envoy.Api.V2.Core.RoutingPriority do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :HIGH

  field(:DEFAULT, 0)
  field(:HIGH, 1)
end

defmodule Envoy.Api.V2.Core.RequestMethod do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :METHOD_UNSPECIFIED
          | :GET
          | :HEAD
          | :POST
          | :PUT
          | :DELETE
          | :CONNECT
          | :OPTIONS
          | :TRACE
          | :PATCH

  field(:METHOD_UNSPECIFIED, 0)
  field(:GET, 1)
  field(:HEAD, 2)
  field(:POST, 3)
  field(:PUT, 4)
  field(:DELETE, 5)
  field(:CONNECT, 6)
  field(:OPTIONS, 7)
  field(:TRACE, 8)
  field(:PATCH, 9)
end

defmodule Envoy.Api.V2.Core.TrafficDirection do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNSPECIFIED | :INBOUND | :OUTBOUND

  field(:UNSPECIFIED, 0)
  field(:INBOUND, 1)
  field(:OUTBOUND, 2)
end

defmodule Envoy.Api.V2.Core.Locality do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          region: String.t(),
          zone: String.t(),
          sub_zone: String.t()
        }
  defstruct [:region, :zone, :sub_zone]

  field(:region, 1, type: :string)
  field(:zone, 2, type: :string)
  field(:sub_zone, 3, type: :string)
end

defmodule Envoy.Api.V2.Core.BuildVersion do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: Envoy.Type.SemanticVersion.t() | nil,
          metadata: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:version, :metadata]

  field(:version, 1, type: Envoy.Type.SemanticVersion)
  field(:metadata, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Core.Extension do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          category: String.t(),
          type_descriptor: String.t(),
          version: Envoy.Api.V2.Core.BuildVersion.t() | nil,
          disabled: boolean
        }
  defstruct [:name, :category, :type_descriptor, :version, :disabled]

  field(:name, 1, type: :string)
  field(:category, 2, type: :string)
  field(:type_descriptor, 3, type: :string)
  field(:version, 4, type: Envoy.Api.V2.Core.BuildVersion)
  field(:disabled, 5, type: :bool)
end

defmodule Envoy.Api.V2.Core.Node do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          user_agent_version_type: {atom, any},
          id: String.t(),
          cluster: String.t(),
          metadata: Google.Protobuf.Struct.t() | nil,
          locality: Envoy.Api.V2.Core.Locality.t() | nil,
          build_version: String.t(),
          user_agent_name: String.t(),
          extensions: [Envoy.Api.V2.Core.Extension.t()],
          client_features: [String.t()],
          listening_addresses: [Envoy.Api.V2.Core.Address.t()]
        }
  defstruct [
    :user_agent_version_type,
    :id,
    :cluster,
    :metadata,
    :locality,
    :build_version,
    :user_agent_name,
    :extensions,
    :client_features,
    :listening_addresses
  ]

  oneof(:user_agent_version_type, 0)
  field(:id, 1, type: :string)
  field(:cluster, 2, type: :string)
  field(:metadata, 3, type: Google.Protobuf.Struct)
  field(:locality, 4, type: Envoy.Api.V2.Core.Locality)
  field(:build_version, 5, type: :string, deprecated: true)
  field(:user_agent_name, 6, type: :string)
  field(:user_agent_version, 7, type: :string, oneof: 0)
  field(:user_agent_build_version, 8, type: Envoy.Api.V2.Core.BuildVersion, oneof: 0)
  field(:extensions, 9, repeated: true, type: Envoy.Api.V2.Core.Extension)
  field(:client_features, 10, repeated: true, type: :string)
  field(:listening_addresses, 11, repeated: true, type: Envoy.Api.V2.Core.Address)
end

defmodule Envoy.Api.V2.Core.Metadata.FilterMetadataEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Core.Metadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filter_metadata: %{String.t() => Google.Protobuf.Struct.t() | nil}
        }
  defstruct [:filter_metadata]

  field(:filter_metadata, 1,
    repeated: true,
    type: Envoy.Api.V2.Core.Metadata.FilterMetadataEntry,
    map: true
  )
end

defmodule Envoy.Api.V2.Core.RuntimeUInt32 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_value: non_neg_integer,
          runtime_key: String.t()
        }
  defstruct [:default_value, :runtime_key]

  field(:default_value, 2, type: :uint32)
  field(:runtime_key, 3, type: :string)
end

defmodule Envoy.Api.V2.Core.RuntimeDouble do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_value: float | :infinity | :negative_infinity | :nan,
          runtime_key: String.t()
        }
  defstruct [:default_value, :runtime_key]

  field(:default_value, 1, type: :double)
  field(:runtime_key, 2, type: :string)
end

defmodule Envoy.Api.V2.Core.RuntimeFeatureFlag do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_value: Google.Protobuf.BoolValue.t() | nil,
          runtime_key: String.t()
        }
  defstruct [:default_value, :runtime_key]

  field(:default_value, 1, type: Google.Protobuf.BoolValue)
  field(:runtime_key, 2, type: :string)
end

defmodule Envoy.Api.V2.Core.HeaderValue do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Api.V2.Core.HeaderValueOption do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header: Envoy.Api.V2.Core.HeaderValue.t() | nil,
          append: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:header, :append]

  field(:header, 1, type: Envoy.Api.V2.Core.HeaderValue)
  field(:append, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Core.HeaderMap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headers: [Envoy.Api.V2.Core.HeaderValue.t()]
        }
  defstruct [:headers]

  field(:headers, 1, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end

defmodule Envoy.Api.V2.Core.DataSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          specifier: {atom, any}
        }
  defstruct [:specifier]

  oneof(:specifier, 0)
  field(:filename, 1, type: :string, oneof: 0)
  field(:inline_bytes, 2, type: :bytes, oneof: 0)
  field(:inline_string, 3, type: :string, oneof: 0)
end

defmodule Envoy.Api.V2.Core.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          retry_back_off: Envoy.Api.V2.Core.BackoffStrategy.t() | nil,
          num_retries: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:retry_back_off, :num_retries]

  field(:retry_back_off, 1, type: Envoy.Api.V2.Core.BackoffStrategy)
  field(:num_retries, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Core.RemoteDataSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_uri: Envoy.Api.V2.Core.HttpUri.t() | nil,
          sha256: String.t(),
          retry_policy: Envoy.Api.V2.Core.RetryPolicy.t() | nil
        }
  defstruct [:http_uri, :sha256, :retry_policy]

  field(:http_uri, 1, type: Envoy.Api.V2.Core.HttpUri)
  field(:sha256, 2, type: :string)
  field(:retry_policy, 3, type: Envoy.Api.V2.Core.RetryPolicy)
end

defmodule Envoy.Api.V2.Core.AsyncDataSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          specifier: {atom, any}
        }
  defstruct [:specifier]

  oneof(:specifier, 0)
  field(:local, 1, type: Envoy.Api.V2.Core.DataSource, oneof: 0)
  field(:remote, 2, type: Envoy.Api.V2.Core.RemoteDataSource, oneof: 0)
end

defmodule Envoy.Api.V2.Core.TransportSocket do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Core.RuntimeFractionalPercent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          default_value: Envoy.Type.FractionalPercent.t() | nil,
          runtime_key: String.t()
        }
  defstruct [:default_value, :runtime_key]

  field(:default_value, 1, type: Envoy.Type.FractionalPercent)
  field(:runtime_key, 2, type: :string)
end

defmodule Envoy.Api.V2.Core.ControlPlane do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: String.t()
        }
  defstruct [:identifier]

  field(:identifier, 1, type: :string)
end
