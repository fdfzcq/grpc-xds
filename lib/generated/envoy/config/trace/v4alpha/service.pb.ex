defmodule Envoy.Config.Trace.V4alpha.TraceServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil
        }
  defstruct [:grpc_service]

  field(:grpc_service, 1, type: Envoy.Config.Core.V4alpha.GrpcService)
end
