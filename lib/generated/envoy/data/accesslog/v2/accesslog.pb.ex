defmodule Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.HTTPVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :PROTOCOL_UNSPECIFIED | :HTTP10 | :HTTP11 | :HTTP2 | :HTTP3

  field(:PROTOCOL_UNSPECIFIED, 0)
  field(:HTTP10, 1)
  field(:HTTP11, 2)
  field(:HTTP2, 3)
  field(:HTTP3, 4)
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.Reason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :REASON_UNSPECIFIED | :EXTERNAL_SERVICE

  field(:REASON_UNSPECIFIED, 0)
  field(:EXTERNAL_SERVICE, 1)
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.TLSVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :VERSION_UNSPECIFIED | :TLSv1 | :TLSv1_1 | :TLSv1_2 | :TLSv1_3

  field(:VERSION_UNSPECIFIED, 0)
  field(:TLSv1, 1)
  field(:TLSv1_1, 2)
  field(:TLSv1_2, 3)
  field(:TLSv1_3, 4)
end

defmodule Envoy.Data.Accesslog.V2.TCPAccessLogEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_properties: Envoy.Data.Accesslog.V2.AccessLogCommon.t() | nil,
          connection_properties: Envoy.Data.Accesslog.V2.ConnectionProperties.t() | nil
        }
  defstruct [:common_properties, :connection_properties]

  field(:common_properties, 1, type: Envoy.Data.Accesslog.V2.AccessLogCommon)
  field(:connection_properties, 2, type: Envoy.Data.Accesslog.V2.ConnectionProperties)
end

defmodule Envoy.Data.Accesslog.V2.HTTPAccessLogEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_properties: Envoy.Data.Accesslog.V2.AccessLogCommon.t() | nil,
          protocol_version: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.HTTPVersion.t(),
          request: Envoy.Data.Accesslog.V2.HTTPRequestProperties.t() | nil,
          response: Envoy.Data.Accesslog.V2.HTTPResponseProperties.t() | nil
        }
  defstruct [:common_properties, :protocol_version, :request, :response]

  field(:common_properties, 1, type: Envoy.Data.Accesslog.V2.AccessLogCommon)

  field(:protocol_version, 2,
    type: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.HTTPVersion,
    enum: true
  )

  field(:request, 3, type: Envoy.Data.Accesslog.V2.HTTPRequestProperties)
  field(:response, 4, type: Envoy.Data.Accesslog.V2.HTTPResponseProperties)
end

defmodule Envoy.Data.Accesslog.V2.ConnectionProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          received_bytes: non_neg_integer,
          sent_bytes: non_neg_integer
        }
  defstruct [:received_bytes, :sent_bytes]

  field(:received_bytes, 1, type: :uint64)
  field(:sent_bytes, 2, type: :uint64)
end

defmodule Envoy.Data.Accesslog.V2.AccessLogCommon.FilterStateObjectsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Any.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Data.Accesslog.V2.AccessLogCommon do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sample_rate: float | :infinity | :negative_infinity | :nan,
          downstream_remote_address: Envoy.Api.V2.Core.Address.t() | nil,
          downstream_local_address: Envoy.Api.V2.Core.Address.t() | nil,
          tls_properties: Envoy.Data.Accesslog.V2.TLSProperties.t() | nil,
          start_time: Google.Protobuf.Timestamp.t() | nil,
          time_to_last_rx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_first_upstream_tx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_last_upstream_tx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_first_upstream_rx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_last_upstream_rx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_first_downstream_tx_byte: Google.Protobuf.Duration.t() | nil,
          time_to_last_downstream_tx_byte: Google.Protobuf.Duration.t() | nil,
          upstream_remote_address: Envoy.Api.V2.Core.Address.t() | nil,
          upstream_local_address: Envoy.Api.V2.Core.Address.t() | nil,
          upstream_cluster: String.t(),
          response_flags: Envoy.Data.Accesslog.V2.ResponseFlags.t() | nil,
          metadata: Envoy.Api.V2.Core.Metadata.t() | nil,
          upstream_transport_failure_reason: String.t(),
          route_name: String.t(),
          downstream_direct_remote_address: Envoy.Api.V2.Core.Address.t() | nil,
          filter_state_objects: %{String.t() => Google.Protobuf.Any.t() | nil}
        }
  defstruct [
    :sample_rate,
    :downstream_remote_address,
    :downstream_local_address,
    :tls_properties,
    :start_time,
    :time_to_last_rx_byte,
    :time_to_first_upstream_tx_byte,
    :time_to_last_upstream_tx_byte,
    :time_to_first_upstream_rx_byte,
    :time_to_last_upstream_rx_byte,
    :time_to_first_downstream_tx_byte,
    :time_to_last_downstream_tx_byte,
    :upstream_remote_address,
    :upstream_local_address,
    :upstream_cluster,
    :response_flags,
    :metadata,
    :upstream_transport_failure_reason,
    :route_name,
    :downstream_direct_remote_address,
    :filter_state_objects
  ]

  field(:sample_rate, 1, type: :double)
  field(:downstream_remote_address, 2, type: Envoy.Api.V2.Core.Address)
  field(:downstream_local_address, 3, type: Envoy.Api.V2.Core.Address)
  field(:tls_properties, 4, type: Envoy.Data.Accesslog.V2.TLSProperties)
  field(:start_time, 5, type: Google.Protobuf.Timestamp)
  field(:time_to_last_rx_byte, 6, type: Google.Protobuf.Duration)
  field(:time_to_first_upstream_tx_byte, 7, type: Google.Protobuf.Duration)
  field(:time_to_last_upstream_tx_byte, 8, type: Google.Protobuf.Duration)
  field(:time_to_first_upstream_rx_byte, 9, type: Google.Protobuf.Duration)
  field(:time_to_last_upstream_rx_byte, 10, type: Google.Protobuf.Duration)
  field(:time_to_first_downstream_tx_byte, 11, type: Google.Protobuf.Duration)
  field(:time_to_last_downstream_tx_byte, 12, type: Google.Protobuf.Duration)
  field(:upstream_remote_address, 13, type: Envoy.Api.V2.Core.Address)
  field(:upstream_local_address, 14, type: Envoy.Api.V2.Core.Address)
  field(:upstream_cluster, 15, type: :string)
  field(:response_flags, 16, type: Envoy.Data.Accesslog.V2.ResponseFlags)
  field(:metadata, 17, type: Envoy.Api.V2.Core.Metadata)
  field(:upstream_transport_failure_reason, 18, type: :string)
  field(:route_name, 19, type: :string)
  field(:downstream_direct_remote_address, 20, type: Envoy.Api.V2.Core.Address)

  field(:filter_state_objects, 21,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.AccessLogCommon.FilterStateObjectsEntry,
    map: true
  )
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reason: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.Reason.t()
        }
  defstruct [:reason]

  field(:reason, 1, type: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.Reason, enum: true)
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_local_healthcheck: boolean,
          no_healthy_upstream: boolean,
          upstream_request_timeout: boolean,
          local_reset: boolean,
          upstream_remote_reset: boolean,
          upstream_connection_failure: boolean,
          upstream_connection_termination: boolean,
          upstream_overflow: boolean,
          no_route_found: boolean,
          delay_injected: boolean,
          fault_injected: boolean,
          rate_limited: boolean,
          unauthorized_details: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.t() | nil,
          rate_limit_service_error: boolean,
          downstream_connection_termination: boolean,
          upstream_retry_limit_exceeded: boolean,
          stream_idle_timeout: boolean,
          invalid_envoy_request_headers: boolean,
          downstream_protocol_error: boolean
        }
  defstruct [
    :failed_local_healthcheck,
    :no_healthy_upstream,
    :upstream_request_timeout,
    :local_reset,
    :upstream_remote_reset,
    :upstream_connection_failure,
    :upstream_connection_termination,
    :upstream_overflow,
    :no_route_found,
    :delay_injected,
    :fault_injected,
    :rate_limited,
    :unauthorized_details,
    :rate_limit_service_error,
    :downstream_connection_termination,
    :upstream_retry_limit_exceeded,
    :stream_idle_timeout,
    :invalid_envoy_request_headers,
    :downstream_protocol_error
  ]

  field(:failed_local_healthcheck, 1, type: :bool)
  field(:no_healthy_upstream, 2, type: :bool)
  field(:upstream_request_timeout, 3, type: :bool)
  field(:local_reset, 4, type: :bool)
  field(:upstream_remote_reset, 5, type: :bool)
  field(:upstream_connection_failure, 6, type: :bool)
  field(:upstream_connection_termination, 7, type: :bool)
  field(:upstream_overflow, 8, type: :bool)
  field(:no_route_found, 9, type: :bool)
  field(:delay_injected, 10, type: :bool)
  field(:fault_injected, 11, type: :bool)
  field(:rate_limited, 12, type: :bool)
  field(:unauthorized_details, 13, type: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized)
  field(:rate_limit_service_error, 14, type: :bool)
  field(:downstream_connection_termination, 15, type: :bool)
  field(:upstream_retry_limit_exceeded, 16, type: :bool)
  field(:stream_idle_timeout, 17, type: :bool)
  field(:invalid_envoy_request_headers, 18, type: :bool)
  field(:downstream_protocol_error, 19, type: :bool)
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.SubjectAltName do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          san: {atom, any}
        }
  defstruct [:san]

  oneof(:san, 0)
  field(:uri, 1, type: :string, oneof: 0)
  field(:dns, 2, type: :string, oneof: 0)
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          subject_alt_name: [
            Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.SubjectAltName.t()
          ],
          subject: String.t()
        }
  defstruct [:subject_alt_name, :subject]

  field(:subject_alt_name, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.SubjectAltName
  )

  field(:subject, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tls_version: Envoy.Data.Accesslog.V2.TLSProperties.TLSVersion.t(),
          tls_cipher_suite: Google.Protobuf.UInt32Value.t() | nil,
          tls_sni_hostname: String.t(),
          local_certificate_properties:
            Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.t() | nil,
          peer_certificate_properties:
            Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.t() | nil,
          tls_session_id: String.t()
        }
  defstruct [
    :tls_version,
    :tls_cipher_suite,
    :tls_sni_hostname,
    :local_certificate_properties,
    :peer_certificate_properties,
    :tls_session_id
  ]

  field(:tls_version, 1, type: Envoy.Data.Accesslog.V2.TLSProperties.TLSVersion, enum: true)
  field(:tls_cipher_suite, 2, type: Google.Protobuf.UInt32Value)
  field(:tls_sni_hostname, 3, type: :string)

  field(:local_certificate_properties, 4,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties
  )

  field(:peer_certificate_properties, 5,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties
  )

  field(:tls_session_id, 6, type: :string)
end

defmodule Envoy.Data.Accesslog.V2.HTTPRequestProperties.RequestHeadersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V2.HTTPRequestProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_method: Envoy.Api.V2.Core.RequestMethod.t(),
          scheme: String.t(),
          authority: String.t(),
          port: Google.Protobuf.UInt32Value.t() | nil,
          path: String.t(),
          user_agent: String.t(),
          referer: String.t(),
          forwarded_for: String.t(),
          request_id: String.t(),
          original_path: String.t(),
          request_headers_bytes: non_neg_integer,
          request_body_bytes: non_neg_integer,
          request_headers: %{String.t() => String.t()}
        }
  defstruct [
    :request_method,
    :scheme,
    :authority,
    :port,
    :path,
    :user_agent,
    :referer,
    :forwarded_for,
    :request_id,
    :original_path,
    :request_headers_bytes,
    :request_body_bytes,
    :request_headers
  ]

  field(:request_method, 1, type: Envoy.Api.V2.Core.RequestMethod, enum: true)
  field(:scheme, 2, type: :string)
  field(:authority, 3, type: :string)
  field(:port, 4, type: Google.Protobuf.UInt32Value)
  field(:path, 5, type: :string)
  field(:user_agent, 6, type: :string)
  field(:referer, 7, type: :string)
  field(:forwarded_for, 8, type: :string)
  field(:request_id, 9, type: :string)
  field(:original_path, 10, type: :string)
  field(:request_headers_bytes, 11, type: :uint64)
  field(:request_body_bytes, 12, type: :uint64)

  field(:request_headers, 13,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPRequestProperties.RequestHeadersEntry,
    map: true
  )
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseHeadersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseTrailersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_code: Google.Protobuf.UInt32Value.t() | nil,
          response_headers_bytes: non_neg_integer,
          response_body_bytes: non_neg_integer,
          response_headers: %{String.t() => String.t()},
          response_trailers: %{String.t() => String.t()},
          response_code_details: String.t()
        }
  defstruct [
    :response_code,
    :response_headers_bytes,
    :response_body_bytes,
    :response_headers,
    :response_trailers,
    :response_code_details
  ]

  field(:response_code, 1, type: Google.Protobuf.UInt32Value)
  field(:response_headers_bytes, 2, type: :uint64)
  field(:response_body_bytes, 3, type: :uint64)

  field(:response_headers, 4,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseHeadersEntry,
    map: true
  )

  field(:response_trailers, 5,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseTrailersEntry,
    map: true
  )

  field(:response_code_details, 6, type: :string)
end
