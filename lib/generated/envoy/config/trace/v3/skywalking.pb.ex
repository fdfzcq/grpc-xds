defmodule Envoy.Config.Trace.V3.SkyWalkingConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil,
          client_config: Envoy.Config.Trace.V3.ClientConfig.t() | nil
        }
  defstruct [:grpc_service, :client_config]

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
  field(:client_config, 2, type: Envoy.Config.Trace.V3.ClientConfig)
end

defmodule Envoy.Config.Trace.V3.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          backend_token_specifier: {atom, any},
          service_name: String.t(),
          instance_name: String.t(),
          max_cache_size: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:backend_token_specifier, :service_name, :instance_name, :max_cache_size]

  oneof(:backend_token_specifier, 0)
  field(:service_name, 1, type: :string)
  field(:instance_name, 2, type: :string)
  field(:backend_token, 3, type: :string, oneof: 0)
  field(:max_cache_size, 4, type: Google.Protobuf.UInt32Value)
end
