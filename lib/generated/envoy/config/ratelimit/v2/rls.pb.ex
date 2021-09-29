defmodule Envoy.Config.Ratelimit.V2.RateLimitServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Api.V2.Core.GrpcService.t() | nil
        }
  defstruct [:grpc_service]

  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
end
