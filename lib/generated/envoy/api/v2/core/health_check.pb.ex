defmodule Envoy.Api.V2.Core.HealthStatus do
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

defmodule Envoy.Api.V2.Core.HealthCheck.Payload do
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

defmodule Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host: String.t(),
          path: String.t(),
          send: Envoy.Api.V2.Core.HealthCheck.Payload.t() | nil,
          receive: Envoy.Api.V2.Core.HealthCheck.Payload.t() | nil,
          service_name: String.t(),
          request_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          use_http2: boolean,
          expected_statuses: [Envoy.Type.Int64Range.t()],
          codec_client_type: Envoy.Type.CodecClientType.t(),
          service_name_matcher: Envoy.Type.Matcher.StringMatcher.t() | nil
        }
  defstruct [
    :host,
    :path,
    :send,
    :receive,
    :service_name,
    :request_headers_to_add,
    :request_headers_to_remove,
    :use_http2,
    :expected_statuses,
    :codec_client_type,
    :service_name_matcher
  ]

  field(:host, 1, type: :string)
  field(:path, 2, type: :string)
  field(:send, 3, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:receive, 4, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:service_name, 5, type: :string, deprecated: true)
  field(:request_headers_to_add, 6, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 8, repeated: true, type: :string)
  field(:use_http2, 7, type: :bool, deprecated: true)
  field(:expected_statuses, 9, repeated: true, type: Envoy.Type.Int64Range)
  field(:codec_client_type, 10, type: Envoy.Type.CodecClientType, enum: true)
  field(:service_name_matcher, 11, type: Envoy.Type.Matcher.StringMatcher)
end

defmodule Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          send: Envoy.Api.V2.Core.HealthCheck.Payload.t() | nil,
          receive: [Envoy.Api.V2.Core.HealthCheck.Payload.t()]
        }
  defstruct [:send, :receive]

  field(:send, 1, type: Envoy.Api.V2.Core.HealthCheck.Payload)
  field(:receive, 2, repeated: true, type: Envoy.Api.V2.Core.HealthCheck.Payload)
end

defmodule Envoy.Api.V2.Core.HealthCheck.RedisHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t()
        }
  defstruct [:key]

  field(:key, 1, type: :string)
end

defmodule Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck do
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

defmodule Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Core.HealthCheck.TlsOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          alpn_protocols: [String.t()]
        }
  defstruct [:alpn_protocols]

  field(:alpn_protocols, 1, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Core.HealthCheck do
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
          unhealthy_interval: Google.Protobuf.Duration.t() | nil,
          unhealthy_edge_interval: Google.Protobuf.Duration.t() | nil,
          healthy_edge_interval: Google.Protobuf.Duration.t() | nil,
          event_log_path: String.t(),
          event_service: Envoy.Api.V2.Core.EventServiceConfig.t() | nil,
          always_log_health_check_failures: boolean,
          tls_options: Envoy.Api.V2.Core.HealthCheck.TlsOptions.t() | nil
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
    :unhealthy_interval,
    :unhealthy_edge_interval,
    :healthy_edge_interval,
    :event_log_path,
    :event_service,
    :always_log_health_check_failures,
    :tls_options
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
  field(:http_health_check, 8, type: Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck, oneof: 0)
  field(:tcp_health_check, 9, type: Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck, oneof: 0)
  field(:grpc_health_check, 11, type: Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck, oneof: 0)
  field(:custom_health_check, 13, type: Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck, oneof: 0)
  field(:no_traffic_interval, 12, type: Google.Protobuf.Duration)
  field(:unhealthy_interval, 14, type: Google.Protobuf.Duration)
  field(:unhealthy_edge_interval, 15, type: Google.Protobuf.Duration)
  field(:healthy_edge_interval, 16, type: Google.Protobuf.Duration)
  field(:event_log_path, 17, type: :string)
  field(:event_service, 22, type: Envoy.Api.V2.Core.EventServiceConfig)
  field(:always_log_health_check_failures, 19, type: :bool)
  field(:tls_options, 21, type: Envoy.Api.V2.Core.HealthCheck.TlsOptions)
end
