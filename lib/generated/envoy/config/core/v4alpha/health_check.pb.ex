defmodule Envoy.Config.Core.V4alpha.HealthStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :HEALTHY | :UNHEALTHY | :DRAINING | :TIMEOUT | :DEGRADED

  field(:UNKNOWN, 0)
  field(:HEALTHY, 1)
  field(:UNHEALTHY, 2)
  field(:DRAINING, 3)
  field(:TIMEOUT, 4)
  field(:DEGRADED, 5)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.Payload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          payload: {atom, any}
        }
  defstruct [:payload]

  oneof(:payload, 0)
  field(:text, 1, type: :string, oneof: 0)
  field(:binary, 2, type: :bytes, oneof: 0)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.HttpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host: String.t(),
          path: String.t(),
          send: Envoy.Config.Core.V4alpha.HealthCheck.Payload.t() | nil,
          receive: Envoy.Config.Core.V4alpha.HealthCheck.Payload.t() | nil,
          request_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          expected_statuses: [Envoy.Type.V3.Int64Range.t()],
          codec_client_type: Envoy.Type.V3.CodecClientType.t(),
          service_name_matcher: Envoy.Type.Matcher.V4alpha.StringMatcher.t() | nil
        }
  defstruct [
    :host,
    :path,
    :send,
    :receive,
    :request_headers_to_add,
    :request_headers_to_remove,
    :expected_statuses,
    :codec_client_type,
    :service_name_matcher
  ]

  field(:host, 1, type: :string)
  field(:path, 2, type: :string)
  field(:send, 3, type: Envoy.Config.Core.V4alpha.HealthCheck.Payload)
  field(:receive, 4, type: Envoy.Config.Core.V4alpha.HealthCheck.Payload)

  field(:request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:request_headers_to_remove, 8, repeated: true, type: :string)
  field(:expected_statuses, 9, repeated: true, type: Envoy.Type.V3.Int64Range)
  field(:codec_client_type, 10, type: Envoy.Type.V3.CodecClientType, enum: true)
  field(:service_name_matcher, 11, type: Envoy.Type.Matcher.V4alpha.StringMatcher)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.TcpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          send: Envoy.Config.Core.V4alpha.HealthCheck.Payload.t() | nil,
          receive: [Envoy.Config.Core.V4alpha.HealthCheck.Payload.t()]
        }
  defstruct [:send, :receive]

  field(:send, 1, type: Envoy.Config.Core.V4alpha.HealthCheck.Payload)
  field(:receive, 2, repeated: true, type: Envoy.Config.Core.V4alpha.HealthCheck.Payload)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.RedisHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t()
        }
  defstruct [:key]

  field(:key, 1, type: :string)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.GrpcHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_name: String.t(),
          authority: String.t()
        }
  defstruct [:service_name, :authority]

  field(:service_name, 1, type: :string)
  field(:authority, 2, type: :string)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.CustomHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck.TlsOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          alpn_protocols: [String.t()]
        }
  defstruct [:alpn_protocols]

  field(:alpn_protocols, 1, repeated: true, type: :string)
end

defmodule Envoy.Config.Core.V4alpha.HealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          health_checker: {atom, any},
          timeout: Google.Protobuf.Duration.t() | nil,
          interval: Google.Protobuf.Duration.t() | nil,
          initial_jitter: Google.Protobuf.Duration.t() | nil,
          interval_jitter: Google.Protobuf.Duration.t() | nil,
          interval_jitter_percent: non_neg_integer,
          unhealthy_threshold: Google.Protobuf.UInt32Value.t() | nil,
          healthy_threshold: Google.Protobuf.UInt32Value.t() | nil,
          alt_port: Google.Protobuf.UInt32Value.t() | nil,
          reuse_connection: Google.Protobuf.BoolValue.t() | nil,
          no_traffic_interval: Google.Protobuf.Duration.t() | nil,
          no_traffic_healthy_interval: Google.Protobuf.Duration.t() | nil,
          unhealthy_interval: Google.Protobuf.Duration.t() | nil,
          unhealthy_edge_interval: Google.Protobuf.Duration.t() | nil,
          healthy_edge_interval: Google.Protobuf.Duration.t() | nil,
          event_log_path: String.t(),
          event_service: Envoy.Config.Core.V4alpha.EventServiceConfig.t() | nil,
          always_log_health_check_failures: boolean,
          tls_options: Envoy.Config.Core.V4alpha.HealthCheck.TlsOptions.t() | nil,
          transport_socket_match_criteria: Google.Protobuf.Struct.t() | nil
        }
  defstruct [
    :health_checker,
    :timeout,
    :interval,
    :initial_jitter,
    :interval_jitter,
    :interval_jitter_percent,
    :unhealthy_threshold,
    :healthy_threshold,
    :alt_port,
    :reuse_connection,
    :no_traffic_interval,
    :no_traffic_healthy_interval,
    :unhealthy_interval,
    :unhealthy_edge_interval,
    :healthy_edge_interval,
    :event_log_path,
    :event_service,
    :always_log_health_check_failures,
    :tls_options,
    :transport_socket_match_criteria
  ]

  oneof(:health_checker, 0)
  field(:timeout, 1, type: Google.Protobuf.Duration)
  field(:interval, 2, type: Google.Protobuf.Duration)
  field(:initial_jitter, 20, type: Google.Protobuf.Duration)
  field(:interval_jitter, 3, type: Google.Protobuf.Duration)
  field(:interval_jitter_percent, 18, type: :uint32)
  field(:unhealthy_threshold, 4, type: Google.Protobuf.UInt32Value)
  field(:healthy_threshold, 5, type: Google.Protobuf.UInt32Value)
  field(:alt_port, 6, type: Google.Protobuf.UInt32Value)
  field(:reuse_connection, 7, type: Google.Protobuf.BoolValue)

  field(:http_health_check, 8,
    type: Envoy.Config.Core.V4alpha.HealthCheck.HttpHealthCheck,
    oneof: 0
  )

  field(:tcp_health_check, 9, type: Envoy.Config.Core.V4alpha.HealthCheck.TcpHealthCheck, oneof: 0)

  field(:grpc_health_check, 11,
    type: Envoy.Config.Core.V4alpha.HealthCheck.GrpcHealthCheck,
    oneof: 0
  )

  field(:custom_health_check, 13,
    type: Envoy.Config.Core.V4alpha.HealthCheck.CustomHealthCheck,
    oneof: 0
  )

  field(:no_traffic_interval, 12, type: Google.Protobuf.Duration)
  field(:no_traffic_healthy_interval, 24, type: Google.Protobuf.Duration)
  field(:unhealthy_interval, 14, type: Google.Protobuf.Duration)
  field(:unhealthy_edge_interval, 15, type: Google.Protobuf.Duration)
  field(:healthy_edge_interval, 16, type: Google.Protobuf.Duration)
  field(:event_log_path, 17, type: :string)
  field(:event_service, 22, type: Envoy.Config.Core.V4alpha.EventServiceConfig)
  field(:always_log_health_check_failures, 19, type: :bool)
  field(:tls_options, 21, type: Envoy.Config.Core.V4alpha.HealthCheck.TlsOptions)
  field(:transport_socket_match_criteria, 23, type: Google.Protobuf.Struct)
end
