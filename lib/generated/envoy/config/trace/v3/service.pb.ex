defmodule Envoy.Config.Trace.V3.TraceServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil
        }
  defstruct [:grpc_service]

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
end
