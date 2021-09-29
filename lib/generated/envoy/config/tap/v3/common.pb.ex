defmodule Envoy.Config.Tap.V3.OutputSink.Format do
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

defmodule Envoy.Config.Tap.V3.TapConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match_config: Envoy.Config.Tap.V3.MatchPredicate.t() | nil,
          match: Envoy.Config.Common.Matcher.V3.MatchPredicate.t() | nil,
          output_config: Envoy.Config.Tap.V3.OutputConfig.t() | nil,
          tap_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil
        }
  defstruct [:match_config, :match, :output_config, :tap_enabled]

  field(:match_config, 1, type: Envoy.Config.Tap.V3.MatchPredicate, deprecated: true)
  field(:match, 4, type: Envoy.Config.Common.Matcher.V3.MatchPredicate)
  field(:output_config, 2, type: Envoy.Config.Tap.V3.OutputConfig)
  field(:tap_enabled, 3, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
end

defmodule Envoy.Config.Tap.V3.MatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Config.Tap.V3.MatchPredicate.t()]
        }
  defstruct [:rules]

  field(:rules, 1, repeated: true, type: Envoy.Config.Tap.V3.MatchPredicate)
end

defmodule Envoy.Config.Tap.V3.MatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:or_match, 1, type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet, oneof: 0)
  field(:and_match, 2, type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet, oneof: 0)
  field(:not_match, 3, type: Envoy.Config.Tap.V3.MatchPredicate, oneof: 0)
  field(:any_match, 4, type: :bool, oneof: 0)
  field(:http_request_headers_match, 5, type: Envoy.Config.Tap.V3.HttpHeadersMatch, oneof: 0)
  field(:http_request_trailers_match, 6, type: Envoy.Config.Tap.V3.HttpHeadersMatch, oneof: 0)
  field(:http_response_headers_match, 7, type: Envoy.Config.Tap.V3.HttpHeadersMatch, oneof: 0)
  field(:http_response_trailers_match, 8, type: Envoy.Config.Tap.V3.HttpHeadersMatch, oneof: 0)

  field(:http_request_generic_body_match, 9,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    oneof: 0
  )

  field(:http_response_generic_body_match, 10,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    oneof: 0
  )
end

defmodule Envoy.Config.Tap.V3.HttpHeadersMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headers: [Envoy.Config.Route.V3.HeaderMatcher.t()]
        }
  defstruct [:headers]

  field(:headers, 1, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher)
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:string_match, 1, type: :string, oneof: 0)
  field(:binary_match, 2, type: :bytes, oneof: 0)
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bytes_limit: non_neg_integer,
          patterns: [Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch.t()]
        }
  defstruct [:bytes_limit, :patterns]

  field(:bytes_limit, 1, type: :uint32)

  field(:patterns, 2,
    repeated: true,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch
  )
end

defmodule Envoy.Config.Tap.V3.OutputConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sinks: [Envoy.Config.Tap.V3.OutputSink.t()],
          max_buffered_rx_bytes: Google.Protobuf.UInt32Value.t() | nil,
          max_buffered_tx_bytes: Google.Protobuf.UInt32Value.t() | nil,
          streaming: boolean
        }
  defstruct [:sinks, :max_buffered_rx_bytes, :max_buffered_tx_bytes, :streaming]

  field(:sinks, 1, repeated: true, type: Envoy.Config.Tap.V3.OutputSink)
  field(:max_buffered_rx_bytes, 2, type: Google.Protobuf.UInt32Value)
  field(:max_buffered_tx_bytes, 3, type: Google.Protobuf.UInt32Value)
  field(:streaming, 4, type: :bool)
end

defmodule Envoy.Config.Tap.V3.OutputSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          output_sink_type: {atom, any},
          format: Envoy.Config.Tap.V3.OutputSink.Format.t()
        }
  defstruct [:output_sink_type, :format]

  oneof(:output_sink_type, 0)
  field(:format, 1, type: Envoy.Config.Tap.V3.OutputSink.Format, enum: true)
  field(:streaming_admin, 2, type: Envoy.Config.Tap.V3.StreamingAdminSink, oneof: 0)
  field(:file_per_tap, 3, type: Envoy.Config.Tap.V3.FilePerTapSink, oneof: 0)
  field(:streaming_grpc, 4, type: Envoy.Config.Tap.V3.StreamingGrpcSink, oneof: 0)
end

defmodule Envoy.Config.Tap.V3.StreamingAdminSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Tap.V3.FilePerTapSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_prefix: String.t()
        }
  defstruct [:path_prefix]

  field(:path_prefix, 1, type: :string)
end

defmodule Envoy.Config.Tap.V3.StreamingGrpcSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tap_id: String.t(),
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil
        }
  defstruct [:tap_id, :grpc_service]

  field(:tap_id, 1, type: :string)
  field(:grpc_service, 2, type: Envoy.Config.Core.V3.GrpcService)
end
