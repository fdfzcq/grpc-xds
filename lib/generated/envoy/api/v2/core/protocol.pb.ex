defmodule Envoy.Api.V2.Core.HttpProtocolOptions.HeadersWithUnderscoresAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ALLOW | :REJECT_REQUEST | :DROP_HEADER

  field(:ALLOW, 0)
  field(:REJECT_REQUEST, 1)
  field(:DROP_HEADER, 2)
end

defmodule Envoy.Api.V2.Core.TcpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Core.UpstreamHttpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          auto_sni: boolean,
          auto_san_validation: boolean
        }
  defstruct [:auto_sni, :auto_san_validation]

  field(:auto_sni, 1, type: :bool)
  field(:auto_san_validation, 2, type: :bool)
end

defmodule Envoy.Api.V2.Core.HttpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          max_connection_duration: Google.Protobuf.Duration.t() | nil,
          max_headers_count: Google.Protobuf.UInt32Value.t() | nil,
          max_stream_duration: Google.Protobuf.Duration.t() | nil,
          headers_with_underscores_action:
            Envoy.Api.V2.Core.HttpProtocolOptions.HeadersWithUnderscoresAction.t()
        }
  defstruct [
    :idle_timeout,
    :max_connection_duration,
    :max_headers_count,
    :max_stream_duration,
    :headers_with_underscores_action
  ]

  field(:idle_timeout, 1, type: Google.Protobuf.Duration)
  field(:max_connection_duration, 3, type: Google.Protobuf.Duration)
  field(:max_headers_count, 2, type: Google.Protobuf.UInt32Value)
  field(:max_stream_duration, 4, type: Google.Protobuf.Duration)

  field(:headers_with_underscores_action, 5,
    type: Envoy.Api.V2.Core.HttpProtocolOptions.HeadersWithUnderscoresAction,
    enum: true
  )
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_format: {atom, any}
        }
  defstruct [:header_format]

  oneof(:header_format, 0)

  field(:proper_case_words, 1,
    type: Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords,
    oneof: 0
  )
end

defmodule Envoy.Api.V2.Core.Http1ProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allow_absolute_url: Google.Protobuf.BoolValue.t() | nil,
          accept_http_10: boolean,
          default_host_for_http_10: String.t(),
          header_key_format: Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat.t() | nil,
          enable_trailers: boolean
        }
  defstruct [
    :allow_absolute_url,
    :accept_http_10,
    :default_host_for_http_10,
    :header_key_format,
    :enable_trailers
  ]

  field(:allow_absolute_url, 1, type: Google.Protobuf.BoolValue)
  field(:accept_http_10, 2, type: :bool)
  field(:default_host_for_http_10, 3, type: :string)
  field(:header_key_format, 4, type: Envoy.Api.V2.Core.Http1ProtocolOptions.HeaderKeyFormat)
  field(:enable_trailers, 5, type: :bool)
end

defmodule Envoy.Api.V2.Core.Http2ProtocolOptions.SettingsParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: Google.Protobuf.UInt32Value.t() | nil,
          value: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:identifier, :value]

  field(:identifier, 1, type: Google.Protobuf.UInt32Value)
  field(:value, 2, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Core.Http2ProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hpack_table_size: Google.Protobuf.UInt32Value.t() | nil,
          max_concurrent_streams: Google.Protobuf.UInt32Value.t() | nil,
          initial_stream_window_size: Google.Protobuf.UInt32Value.t() | nil,
          initial_connection_window_size: Google.Protobuf.UInt32Value.t() | nil,
          allow_connect: boolean,
          allow_metadata: boolean,
          max_outbound_frames: Google.Protobuf.UInt32Value.t() | nil,
          max_outbound_control_frames: Google.Protobuf.UInt32Value.t() | nil,
          max_consecutive_inbound_frames_with_empty_payload:
            Google.Protobuf.UInt32Value.t() | nil,
          max_inbound_priority_frames_per_stream: Google.Protobuf.UInt32Value.t() | nil,
          max_inbound_window_update_frames_per_data_frame_sent:
            Google.Protobuf.UInt32Value.t() | nil,
          stream_error_on_invalid_http_messaging: boolean,
          custom_settings_parameters: [
            Envoy.Api.V2.Core.Http2ProtocolOptions.SettingsParameter.t()
          ]
        }
  defstruct [
    :hpack_table_size,
    :max_concurrent_streams,
    :initial_stream_window_size,
    :initial_connection_window_size,
    :allow_connect,
    :allow_metadata,
    :max_outbound_frames,
    :max_outbound_control_frames,
    :max_consecutive_inbound_frames_with_empty_payload,
    :max_inbound_priority_frames_per_stream,
    :max_inbound_window_update_frames_per_data_frame_sent,
    :stream_error_on_invalid_http_messaging,
    :custom_settings_parameters
  ]

  field(:hpack_table_size, 1, type: Google.Protobuf.UInt32Value)
  field(:max_concurrent_streams, 2, type: Google.Protobuf.UInt32Value)
  field(:initial_stream_window_size, 3, type: Google.Protobuf.UInt32Value)
  field(:initial_connection_window_size, 4, type: Google.Protobuf.UInt32Value)
  field(:allow_connect, 5, type: :bool)
  field(:allow_metadata, 6, type: :bool)
  field(:max_outbound_frames, 7, type: Google.Protobuf.UInt32Value)
  field(:max_outbound_control_frames, 8, type: Google.Protobuf.UInt32Value)
  field(:max_consecutive_inbound_frames_with_empty_payload, 9, type: Google.Protobuf.UInt32Value)
  field(:max_inbound_priority_frames_per_stream, 10, type: Google.Protobuf.UInt32Value)

  field(:max_inbound_window_update_frames_per_data_frame_sent, 11,
    type: Google.Protobuf.UInt32Value
  )

  field(:stream_error_on_invalid_http_messaging, 12, type: :bool)

  field(:custom_settings_parameters, 13,
    repeated: true,
    type: Envoy.Api.V2.Core.Http2ProtocolOptions.SettingsParameter
  )
end

defmodule Envoy.Api.V2.Core.GrpcProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http2_protocol_options: Envoy.Api.V2.Core.Http2ProtocolOptions.t() | nil
        }
  defstruct [:http2_protocol_options]

  field(:http2_protocol_options, 1, type: Envoy.Api.V2.Core.Http2ProtocolOptions)
end
