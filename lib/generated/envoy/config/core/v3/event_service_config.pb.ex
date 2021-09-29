defmodule Envoy.Config.Core.V3.EventServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source_specifier: {atom, any}
        }
  defstruct [:config_source_specifier]

  oneof(:config_source_specifier, 0)
  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, oneof: 0)
end
