defmodule Envoy.Extensions.Filters.Http.Router.V3.Router do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dynamic_stats: Google.Protobuf.BoolValue.t() | nil,
          start_child_span: boolean,
          upstream_log: [Envoy.Config.Accesslog.V3.AccessLog.t()],
          suppress_envoy_headers: boolean,
          strict_check_headers: [String.t()],
          respect_expected_rq_timeout: boolean
        }
  defstruct [
    :dynamic_stats,
    :start_child_span,
    :upstream_log,
    :suppress_envoy_headers,
    :strict_check_headers,
    :respect_expected_rq_timeout
  ]

  field(:dynamic_stats, 1, type: Google.Protobuf.BoolValue)
  field(:start_child_span, 2, type: :bool)
  field(:upstream_log, 3, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLog)
  field(:suppress_envoy_headers, 4, type: :bool)
  field(:strict_check_headers, 5, repeated: true, type: :string)
  field(:respect_expected_rq_timeout, 6, type: :bool)
end
