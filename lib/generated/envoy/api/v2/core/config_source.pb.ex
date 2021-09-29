defmodule Envoy.Api.V2.Core.ApiVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO | :V2 | :V3

  field(:AUTO, 0)
  field(:V2, 1)
  field(:V3, 2)
end

defmodule Envoy.Api.V2.Core.ApiConfigSource.ApiType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNSUPPORTED_REST_LEGACY | :REST | :GRPC | :DELTA_GRPC

  field(:UNSUPPORTED_REST_LEGACY, 0)
  field(:REST, 1)
  field(:GRPC, 2)
  field(:DELTA_GRPC, 3)
end

defmodule Envoy.Api.V2.Core.ApiConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          api_type: Envoy.Api.V2.Core.ApiConfigSource.ApiType.t(),
          transport_api_version: Envoy.Api.V2.Core.ApiVersion.t(),
          cluster_names: [String.t()],
          grpc_services: [Envoy.Api.V2.Core.GrpcService.t()],
          refresh_delay: Google.Protobuf.Duration.t() | nil,
          request_timeout: Google.Protobuf.Duration.t() | nil,
          rate_limit_settings: Envoy.Api.V2.Core.RateLimitSettings.t() | nil,
          set_node_on_first_message_only: boolean
        }
  defstruct [
    :api_type,
    :transport_api_version,
    :cluster_names,
    :grpc_services,
    :refresh_delay,
    :request_timeout,
    :rate_limit_settings,
    :set_node_on_first_message_only
  ]

  field(:api_type, 1, type: Envoy.Api.V2.Core.ApiConfigSource.ApiType, enum: true)
  field(:transport_api_version, 8, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
  field(:cluster_names, 2, repeated: true, type: :string)
  field(:grpc_services, 4, repeated: true, type: Envoy.Api.V2.Core.GrpcService)
  field(:refresh_delay, 3, type: Google.Protobuf.Duration)
  field(:request_timeout, 5, type: Google.Protobuf.Duration)
  field(:rate_limit_settings, 6, type: Envoy.Api.V2.Core.RateLimitSettings)
  field(:set_node_on_first_message_only, 7, type: :bool)
end

defmodule Envoy.Api.V2.Core.AggregatedConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Core.SelfConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transport_api_version: Envoy.Api.V2.Core.ApiVersion.t()
        }
  defstruct [:transport_api_version]

  field(:transport_api_version, 1, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
end

defmodule Envoy.Api.V2.Core.RateLimitSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_tokens: Google.Protobuf.UInt32Value.t() | nil,
          fill_rate: Google.Protobuf.DoubleValue.t() | nil
        }
  defstruct [:max_tokens, :fill_rate]

  field(:max_tokens, 1, type: Google.Protobuf.UInt32Value)
  field(:fill_rate, 2, type: Google.Protobuf.DoubleValue)
end

defmodule Envoy.Api.V2.Core.ConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source_specifier: {atom, any},
          initial_fetch_timeout: Google.Protobuf.Duration.t() | nil,
          resource_api_version: Envoy.Api.V2.Core.ApiVersion.t()
        }
  defstruct [:config_source_specifier, :initial_fetch_timeout, :resource_api_version]

  oneof(:config_source_specifier, 0)
  field(:path, 1, type: :string, oneof: 0)
  field(:api_config_source, 2, type: Envoy.Api.V2.Core.ApiConfigSource, oneof: 0)
  field(:ads, 3, type: Envoy.Api.V2.Core.AggregatedConfigSource, oneof: 0)
  field(:self, 5, type: Envoy.Api.V2.Core.SelfConfigSource, oneof: 0)
  field(:initial_fetch_timeout, 4, type: Google.Protobuf.Duration)
  field(:resource_api_version, 6, type: Envoy.Api.V2.Core.ApiVersion, enum: true)
end
