defmodule Envoy.Config.Ratelimit.V4alpha.RateLimitServiceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil,
          transport_api_version: Envoy.Config.Core.V4alpha.ApiVersion.t()
        }
  defstruct [:grpc_service, :transport_api_version]

  field(:grpc_service, 2, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:transport_api_version, 4, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
end
