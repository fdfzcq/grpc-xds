defmodule Envoy.Config.Core.V4alpha.EventServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source_specifier: {atom, any}
        }
  defstruct [:config_source_specifier]

  oneof(:config_source_specifier, 0)
  field(:grpc_service, 1, type: Envoy.Config.Core.V4alpha.GrpcService, oneof: 0)
end
