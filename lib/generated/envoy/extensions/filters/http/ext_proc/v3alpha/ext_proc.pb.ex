defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExternalProcessor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          grpc_service: Envoy.Config.Core.V3.GrpcService.t() | nil,
          failure_mode_allow: boolean,
          processing_mode: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.t() | nil,
          async_mode: boolean,
          request_attributes: [String.t()],
          response_attributes: [String.t()],
          message_timeout: Google.Protobuf.Duration.t() | nil,
          stat_prefix: String.t()
        }
  defstruct [
    :grpc_service,
    :failure_mode_allow,
    :processing_mode,
    :async_mode,
    :request_attributes,
    :response_attributes,
    :message_timeout,
    :stat_prefix
  ]

  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService)
  field(:failure_mode_allow, 2, type: :bool)
  field(:processing_mode, 3, type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode)
  field(:async_mode, 4, type: :bool)
  field(:request_attributes, 5, repeated: true, type: :string)
  field(:response_attributes, 6, repeated: true, type: :string)
  field(:message_timeout, 7, type: Google.Protobuf.Duration)
  field(:stat_prefix, 8, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override: {atom, any}
        }
  defstruct [:override]

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)

  field(:overrides, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcOverrides,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ExtProcOverrides do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          processing_mode: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.t() | nil,
          async_mode: boolean,
          request_properties: [String.t()],
          response_properties: [String.t()]
        }
  defstruct [:processing_mode, :async_mode, :request_properties, :response_properties]

  field(:processing_mode, 1, type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode)
  field(:async_mode, 2, type: :bool)
  field(:request_properties, 3, repeated: true, type: :string)
  field(:response_properties, 4, repeated: true, type: :string)
end
