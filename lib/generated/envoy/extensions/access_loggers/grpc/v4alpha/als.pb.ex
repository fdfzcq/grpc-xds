defmodule Envoy.Extensions.AccessLoggers.Grpc.V4alpha.HttpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.AccessLoggers.Grpc.V4alpha.CommonGrpcAccessLogConfig.t() | nil,
          additional_request_headers_to_log: [String.t()],
          additional_response_headers_to_log: [String.t()],
          additional_response_trailers_to_log: [String.t()]
        }
  defstruct [
    :common_config,
    :additional_request_headers_to_log,
    :additional_response_headers_to_log,
    :additional_response_trailers_to_log
  ]

  field(:common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V4alpha.CommonGrpcAccessLogConfig
  )

  field(:additional_request_headers_to_log, 2, repeated: true, type: :string)
  field(:additional_response_headers_to_log, 3, repeated: true, type: :string)
  field(:additional_response_trailers_to_log, 4, repeated: true, type: :string)
end

defmodule Envoy.Extensions.AccessLoggers.Grpc.V4alpha.TcpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.AccessLoggers.Grpc.V4alpha.CommonGrpcAccessLogConfig.t() | nil
        }
  defstruct [:common_config]

  field(:common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V4alpha.CommonGrpcAccessLogConfig
  )
end

defmodule Envoy.Extensions.AccessLoggers.Grpc.V4alpha.CommonGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          log_name: String.t(),
          grpc_service: Envoy.Config.Core.V4alpha.GrpcService.t() | nil,
          transport_api_version: Envoy.Config.Core.V4alpha.ApiVersion.t(),
          buffer_flush_interval: Google.Protobuf.Duration.t() | nil,
          buffer_size_bytes: Google.Protobuf.UInt32Value.t() | nil,
          filter_state_objects_to_log: [String.t()]
        }
  defstruct [
    :log_name,
    :grpc_service,
    :transport_api_version,
    :buffer_flush_interval,
    :buffer_size_bytes,
    :filter_state_objects_to_log
  ]

  field(:log_name, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Config.Core.V4alpha.GrpcService)
  field(:transport_api_version, 6, type: Envoy.Config.Core.V4alpha.ApiVersion, enum: true)
  field(:buffer_flush_interval, 3, type: Google.Protobuf.Duration)
  field(:buffer_size_bytes, 4, type: Google.Protobuf.UInt32Value)
  field(:filter_state_objects_to_log, 5, repeated: true, type: :string)
end
