defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content_type: String.t(),
          withhold_grpc_frames: boolean
        }
  defstruct [:content_type, :withhold_grpc_frames]

  field(:content_type, 1, type: :string)
  field(:withhold_grpc_frames, 2, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfigPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          disabled: boolean
        }
  defstruct [:disabled]

  field(:disabled, 1, type: :bool)
end
