defmodule Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.Op do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :EQ | :GE | :LE

  field(:EQ, 0)
  field(:GE, 1)
  field(:LE, 2)
end

defmodule Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter.Status do
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

defmodule Envoy.Config.Filter.Accesslog.V2.AccessLog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t(),
          filter: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter.t() | nil
        }
  defstruct [:config_type, :name, :filter]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:filter, 2, type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter)
  field(:config, 3, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Filter.Accesslog.V2.AccessLogFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filter_specifier: {atom, any}
        }
  defstruct [:filter_specifier]

  oneof(:filter_specifier, 0)
  field(:status_code_filter, 1, type: Envoy.Config.Filter.Accesslog.V2.StatusCodeFilter, oneof: 0)
  field(:duration_filter, 2, type: Envoy.Config.Filter.Accesslog.V2.DurationFilter, oneof: 0)

  field(:not_health_check_filter, 3,
    type: Envoy.Config.Filter.Accesslog.V2.NotHealthCheckFilter,
    oneof: 0
  )

  field(:traceable_filter, 4, type: Envoy.Config.Filter.Accesslog.V2.TraceableFilter, oneof: 0)
  field(:runtime_filter, 5, type: Envoy.Config.Filter.Accesslog.V2.RuntimeFilter, oneof: 0)
  field(:and_filter, 6, type: Envoy.Config.Filter.Accesslog.V2.AndFilter, oneof: 0)
  field(:or_filter, 7, type: Envoy.Config.Filter.Accesslog.V2.OrFilter, oneof: 0)
  field(:header_filter, 8, type: Envoy.Config.Filter.Accesslog.V2.HeaderFilter, oneof: 0)

  field(:response_flag_filter, 9,
    type: Envoy.Config.Filter.Accesslog.V2.ResponseFlagFilter,
    oneof: 0
  )

  field(:grpc_status_filter, 10, type: Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter, oneof: 0)

  field(:extension_filter, 11, type: Envoy.Config.Filter.Accesslog.V2.ExtensionFilter, oneof: 0)
end

defmodule Envoy.Config.Filter.Accesslog.V2.ComparisonFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          op: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.Op.t(),
          value: Envoy.Api.V2.Core.RuntimeUInt32.t() | nil
        }
  defstruct [:op, :value]

  field(:op, 1, type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.Op, enum: true)
  field(:value, 2, type: Envoy.Api.V2.Core.RuntimeUInt32)
end

defmodule Envoy.Config.Filter.Accesslog.V2.StatusCodeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          comparison: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.t() | nil
        }
  defstruct [:comparison]

  field(:comparison, 1, type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter)
end

defmodule Envoy.Config.Filter.Accesslog.V2.DurationFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          comparison: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter.t() | nil
        }
  defstruct [:comparison]

  field(:comparison, 1, type: Envoy.Config.Filter.Accesslog.V2.ComparisonFilter)
end

defmodule Envoy.Config.Filter.Accesslog.V2.NotHealthCheckFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Accesslog.V2.TraceableFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Accesslog.V2.RuntimeFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          runtime_key: String.t(),
          percent_sampled: Envoy.Type.FractionalPercent.t() | nil,
          use_independent_randomness: boolean
        }
  defstruct [:runtime_key, :percent_sampled, :use_independent_randomness]

  field(:runtime_key, 1, type: :string)
  field(:percent_sampled, 2, type: Envoy.Type.FractionalPercent)
  field(:use_independent_randomness, 3, type: :bool)
end

defmodule Envoy.Config.Filter.Accesslog.V2.AndFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters: [Envoy.Config.Filter.Accesslog.V2.AccessLogFilter.t()]
        }
  defstruct [:filters]

  field(:filters, 1, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter)
end

defmodule Envoy.Config.Filter.Accesslog.V2.OrFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filters: [Envoy.Config.Filter.Accesslog.V2.AccessLogFilter.t()]
        }
  defstruct [:filters]

  field(:filters, 2, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLogFilter)
end

defmodule Envoy.Config.Filter.Accesslog.V2.HeaderFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header: Envoy.Api.V2.Route.HeaderMatcher.t() | nil
        }
  defstruct [:header]

  field(:header, 1, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Config.Filter.Accesslog.V2.ResponseFlagFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          flags: [String.t()]
        }
  defstruct [:flags]

  field(:flags, 1, repeated: true, type: :string)
end

defmodule Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          statuses: [[Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter.Status.t()]],
          exclude: boolean
        }
  defstruct [:statuses, :exclude]

  field(:statuses, 1,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.GrpcStatusFilter.Status,
    enum: true
  )

  field(:exclude, 2, type: :bool)
end

defmodule Envoy.Config.Filter.Accesslog.V2.ExtensionFilter do
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
