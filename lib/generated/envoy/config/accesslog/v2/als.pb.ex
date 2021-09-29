defmodule Envoy.Config.Accesslog.V2.HttpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig.t() | nil,
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

  field(:common_config, 1, type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig)
  field(:additional_request_headers_to_log, 2, repeated: true, type: :string)
  field(:additional_response_headers_to_log, 3, repeated: true, type: :string)
  field(:additional_response_trailers_to_log, 4, repeated: true, type: :string)
end

defmodule Envoy.Config.Accesslog.V2.TcpGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig.t() | nil
        }
  defstruct [:common_config]

  field(:common_config, 1, type: Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig)
end

defmodule Envoy.Config.Accesslog.V2.CommonGrpcAccessLogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          log_name: String.t(),
          grpc_service: Envoy.Api.V2.Core.GrpcService.t() | nil,
          buffer_flush_interval: Google.Protobuf.Duration.t() | nil,
          buffer_size_bytes: Google.Protobuf.UInt32Value.t() | nil,
          filter_state_objects_to_log: [String.t()]
        }
  defstruct [
    :log_name,
    :grpc_service,
    :buffer_flush_interval,
    :buffer_size_bytes,
    :filter_state_objects_to_log
  ]

  field(:log_name, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
  field(:buffer_flush_interval, 3, type: Google.Protobuf.Duration)
  field(:buffer_size_bytes, 4, type: Google.Protobuf.UInt32Value)
  field(:filter_state_objects_to_log, 5, repeated: true, type: :string)
end
