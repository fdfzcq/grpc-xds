defmodule Envoy.Service.Tap.V2alpha.OutputSink.Format do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :JSON_BODY_AS_BYTES
          | :JSON_BODY_AS_STRING
          | :PROTO_BINARY
          | :PROTO_BINARY_LENGTH_DELIMITED
          | :PROTO_TEXT

  field(:JSON_BODY_AS_BYTES, 0)
  field(:JSON_BODY_AS_STRING, 1)
  field(:PROTO_BINARY, 2)
  field(:PROTO_BINARY_LENGTH_DELIMITED, 3)
  field(:PROTO_TEXT, 4)
end

defmodule Envoy.Service.Tap.V2alpha.TapConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match_config: Envoy.Service.Tap.V2alpha.MatchPredicate.t() | nil,
          output_config: Envoy.Service.Tap.V2alpha.OutputConfig.t() | nil,
          tap_enabled: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil
        }
  defstruct [:match_config, :output_config, :tap_enabled]

  field(:match_config, 1, type: Envoy.Service.Tap.V2alpha.MatchPredicate)
  field(:output_config, 2, type: Envoy.Service.Tap.V2alpha.OutputConfig)
  field(:tap_enabled, 3, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Service.Tap.V2alpha.MatchPredicate.t()]
        }
  defstruct [:rules]

  field(:rules, 1, repeated: true, type: Envoy.Service.Tap.V2alpha.MatchPredicate)
end

defmodule Envoy.Service.Tap.V2alpha.MatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:or_match, 1, type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet, oneof: 0)
  field(:and_match, 2, type: Envoy.Service.Tap.V2alpha.MatchPredicate.MatchSet, oneof: 0)
  field(:not_match, 3, type: Envoy.Service.Tap.V2alpha.MatchPredicate, oneof: 0)
  field(:any_match, 4, type: :bool, oneof: 0)

  field(:http_request_headers_match, 5, type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch, oneof: 0)

  field(:http_request_trailers_match, 6,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_headers_match, 7,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_trailers_match, 8,
    type: Envoy.Service.Tap.V2alpha.HttpHeadersMatch,
    oneof: 0
  )
end

defmodule Envoy.Service.Tap.V2alpha.HttpHeadersMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headers: [Envoy.Api.V2.Route.HeaderMatcher.t()]
        }
  defstruct [:headers]

  field(:headers, 1, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Service.Tap.V2alpha.OutputConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sinks: [Envoy.Service.Tap.V2alpha.OutputSink.t()],
          max_buffered_rx_bytes: Google.Protobuf.UInt32Value.t() | nil,
          max_buffered_tx_bytes: Google.Protobuf.UInt32Value.t() | nil,
          streaming: boolean
        }
  defstruct [:sinks, :max_buffered_rx_bytes, :max_buffered_tx_bytes, :streaming]

  field(:sinks, 1, repeated: true, type: Envoy.Service.Tap.V2alpha.OutputSink)
  field(:max_buffered_rx_bytes, 2, type: Google.Protobuf.UInt32Value)
  field(:max_buffered_tx_bytes, 3, type: Google.Protobuf.UInt32Value)
  field(:streaming, 4, type: :bool)
end

defmodule Envoy.Service.Tap.V2alpha.OutputSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          output_sink_type: {atom, any},
          format: Envoy.Service.Tap.V2alpha.OutputSink.Format.t()
        }
  defstruct [:output_sink_type, :format]

  oneof(:output_sink_type, 0)
  field(:format, 1, type: Envoy.Service.Tap.V2alpha.OutputSink.Format, enum: true)
  field(:streaming_admin, 2, type: Envoy.Service.Tap.V2alpha.StreamingAdminSink, oneof: 0)
  field(:file_per_tap, 3, type: Envoy.Service.Tap.V2alpha.FilePerTapSink, oneof: 0)
  field(:streaming_grpc, 4, type: Envoy.Service.Tap.V2alpha.StreamingGrpcSink, oneof: 0)
end

defmodule Envoy.Service.Tap.V2alpha.StreamingAdminSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Service.Tap.V2alpha.FilePerTapSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_prefix: String.t()
        }
  defstruct [:path_prefix]

  field(:path_prefix, 1, type: :string)
end

defmodule Envoy.Service.Tap.V2alpha.StreamingGrpcSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tap_id: String.t(),
          grpc_service: Envoy.Api.V2.Core.GrpcService.t() | nil
        }
  defstruct [:tap_id, :grpc_service]

  field(:tap_id, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService)
end
