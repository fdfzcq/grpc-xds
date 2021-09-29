defmodule Envoy.Extensions.Filters.Http.GrpcStats.V3.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          per_method_stat_specifier: {atom, any},
          emit_filter_state: boolean,
          enable_upstream_stats: boolean
        }
  defstruct [:per_method_stat_specifier, :emit_filter_state, :enable_upstream_stats]

  oneof(:per_method_stat_specifier, 0)
  field(:emit_filter_state, 1, type: :bool)

  field(:individual_method_stats_allowlist, 2, type: Envoy.Config.Core.V3.GrpcMethodList, oneof: 0)

  field(:stats_for_all_methods, 3, type: Google.Protobuf.BoolValue, oneof: 0)
  field(:enable_upstream_stats, 4, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.GrpcStats.V3.FilterObject do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_message_count: non_neg_integer,
          response_message_count: non_neg_integer
        }
  defstruct [:request_message_count, :response_message_count]

  field(:request_message_count, 1, type: :uint64)
  field(:response_message_count, 2, type: :uint64)
end
