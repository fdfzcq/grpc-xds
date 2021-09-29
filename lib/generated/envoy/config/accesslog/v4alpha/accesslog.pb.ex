defmodule Envoy.Config.Accesslog.V4alpha.ComparisonFilter.Op do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :EQ | :GE | :LE

  field(:EQ, 0)
  field(:GE, 1)
  field(:LE, 2)
end

defmodule Envoy.Config.Accesslog.V4alpha.GrpcStatusFilter.Status do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :OK
          | :CANCELED
          | :UNKNOWN
          | :INVALID_ARGUMENT
          | :DEADLINE_EXCEEDED
          | :NOT_FOUND
          | :ALREADY_EXISTS
          | :PERMISSION_DENIED
          | :RESOURCE_EXHAUSTED
          | :FAILED_PRECONDITION
          | :ABORTED
          | :OUT_OF_RANGE
          | :UNIMPLEMENTED
          | :INTERNAL
          | :UNAVAILABLE
          | :DATA_LOSS
          | :UNAUTHENTICATED

  field(:OK, 0)
  field(:CANCELED, 1)
  field(:UNKNOWN, 2)
  field(:INVALID_ARGUMENT, 3)
  field(:DEADLINE_EXCEEDED, 4)
  field(:NOT_FOUND, 5)
  field(:ALREADY_EXISTS, 6)
  field(:PERMISSION_DENIED, 7)
  field(:RESOURCE_EXHAUSTED, 8)
  field(:FAILED_PRECONDITION, 9)
  field(:ABORTED, 10)
  field(:OUT_OF_RANGE, 11)
  field(:UNIMPLEMENTED, 12)
  field(:INTERNAL, 13)
  field(:UNAVAILABLE, 14)
  field(:DATA_LOSS, 15)
  field(:UNAUTHENTICATED, 16)
end

defmodule Envoy.Config.Accesslog.V4alpha.AccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t(),
          filter: Envoy.Config.Accesslog.V4alpha.AccessLogFilter.t() | nil
        }
  defstruct [:config_type, :name, :filter]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:filter, 2, type: Envoy.Config.Accesslog.V4alpha.AccessLogFilter)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Accesslog.V4alpha.AccessLogFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filter_specifier: {atom, any}
        }
  defstruct [:filter_specifier]

  oneof(:filter_specifier, 0)
  field(:status_code_filter, 1, type: Envoy.Config.Accesslog.V4alpha.StatusCodeFilter, oneof: 0)
  field(:duration_filter, 2, type: Envoy.Config.Accesslog.V4alpha.DurationFilter, oneof: 0)

  field(:not_health_check_filter, 3,
    type: Envoy.Config.Accesslog.V4alpha.NotHealthCheckFilter,
    oneof: 0
  )

  field(:traceable_filter, 4, type: Envoy.Config.Accesslog.V4alpha.TraceableFilter, oneof: 0)
  field(:runtime_filter, 5, type: Envoy.Config.Accesslog.V4alpha.RuntimeFilter, oneof: 0)
  field(:and_filter, 6, type: Envoy.Config.Accesslog.V4alpha.AndFilter, oneof: 0)
  field(:or_filter, 7, type: Envoy.Config.Accesslog.V4alpha.OrFilter, oneof: 0)
  field(:header_filter, 8, type: Envoy.Config.Accesslog.V4alpha.HeaderFilter, oneof: 0)

  field(:response_flag_filter, 9,
    type: Envoy.Config.Accesslog.V4alpha.ResponseFlagFilter,
    oneof: 0
  )

  field(:grpc_status_filter, 10, type: Envoy.Config.Accesslog.V4alpha.GrpcStatusFilter, oneof: 0)
  field(:extension_filter, 11, type: Envoy.Config.Accesslog.V4alpha.ExtensionFilter, oneof: 0)
  field(:metadata_filter, 12, type: Envoy.Config.Accesslog.V4alpha.MetadataFilter, oneof: 0)
end

defmodule Envoy.Config.Accesslog.V4alpha.ComparisonFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          op: Envoy.Config.Accesslog.V4alpha.ComparisonFilter.Op.t(),
          value: Envoy.Config.Core.V4alpha.RuntimeUInt32.t() | nil
        }
  defstruct [:op, :value]

  field(:op, 1, type: Envoy.Config.Accesslog.V4alpha.ComparisonFilter.Op, enum: true)
  field(:value, 2, type: Envoy.Config.Core.V4alpha.RuntimeUInt32)
end

defmodule Envoy.Config.Accesslog.V4alpha.StatusCodeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          comparison: Envoy.Config.Accesslog.V4alpha.ComparisonFilter.t() | nil
        }
  defstruct [:comparison]

  field(:comparison, 1, type: Envoy.Config.Accesslog.V4alpha.ComparisonFilter)
end

defmodule Envoy.Config.Accesslog.V4alpha.DurationFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          comparison: Envoy.Config.Accesslog.V4alpha.ComparisonFilter.t() | nil
        }
  defstruct [:comparison]

  field(:comparison, 1, type: Envoy.Config.Accesslog.V4alpha.ComparisonFilter)
end

defmodule Envoy.Config.Accesslog.V4alpha.NotHealthCheckFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Accesslog.V4alpha.TraceableFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Accesslog.V4alpha.RuntimeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          runtime_key: String.t(),
          percent_sampled: Envoy.Type.V3.FractionalPercent.t() | nil,
          use_independent_randomness: boolean
        }
  defstruct [:runtime_key, :percent_sampled, :use_independent_randomness]

  field(:runtime_key, 1, type: :string)
  field(:percent_sampled, 2, type: Envoy.Type.V3.FractionalPercent)
  field(:use_independent_randomness, 3, type: :bool)
end

defmodule Envoy.Config.Accesslog.V4alpha.AndFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters: [Envoy.Config.Accesslog.V4alpha.AccessLogFilter.t()]
        }
  defstruct [:filters]

  field(:filters, 1, repeated: true, type: Envoy.Config.Accesslog.V4alpha.AccessLogFilter)
end

defmodule Envoy.Config.Accesslog.V4alpha.OrFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters: [Envoy.Config.Accesslog.V4alpha.AccessLogFilter.t()]
        }
  defstruct [:filters]

  field(:filters, 2, repeated: true, type: Envoy.Config.Accesslog.V4alpha.AccessLogFilter)
end

defmodule Envoy.Config.Accesslog.V4alpha.HeaderFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header: Envoy.Config.Route.V4alpha.HeaderMatcher.t() | nil
        }
  defstruct [:header]

  field(:header, 1, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Config.Accesslog.V4alpha.ResponseFlagFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          flags: [String.t()]
        }
  defstruct [:flags]

  field(:flags, 1, repeated: true, type: :string)
end

defmodule Envoy.Config.Accesslog.V4alpha.GrpcStatusFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          statuses: [[Envoy.Config.Accesslog.V4alpha.GrpcStatusFilter.Status.t()]],
          exclude: boolean
        }
  defstruct [:statuses, :exclude]

  field(:statuses, 1,
    repeated: true,
    type: Envoy.Config.Accesslog.V4alpha.GrpcStatusFilter.Status,
    enum: true
  )

  field(:exclude, 2, type: :bool)
end

defmodule Envoy.Config.Accesslog.V4alpha.MetadataFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          matcher: Envoy.Type.Matcher.V4alpha.MetadataMatcher.t() | nil,
          match_if_key_not_found: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:matcher, :match_if_key_not_found]

  field(:matcher, 1, type: Envoy.Type.Matcher.V4alpha.MetadataMatcher)
  field(:match_if_key_not_found, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Accesslog.V4alpha.ExtensionFilter do
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
