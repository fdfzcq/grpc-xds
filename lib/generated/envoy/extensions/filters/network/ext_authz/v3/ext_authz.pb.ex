defmodule Envoy.Extensions.Filters.Network.ExtAuthz.V3.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil,
          failure_mode_allow: boolean,
          include_peer_certificate: boolean,
          transport_api_version: Envoy.Config.Core.V3.ApiVersion.t(),
          filter_enabled_metadata: Envoy.Type.Matcher.V3.MetadataMatcher.t() | nil
        }
  defstruct [
    :stat_prefix,
    :grpc_service,
    :failure_mode_allow,
    :include_peer_certificate,
    :transport_api_version,
    :filter_enabled_metadata
  ]

  field(:stat_prefix, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Config.Core.V3.GrpcService)
  field(:failure_mode_allow, 3, type: :bool)
  field(:include_peer_certificate, 4, type: :bool)
  field(:transport_api_version, 5, type: Envoy.Config.Core.V3.ApiVersion, enum: true)
  field(:filter_enabled_metadata, 6, type: Envoy.Type.Matcher.V3.MetadataMatcher)
end
