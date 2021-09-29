defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SYNCHRONOUS | :ASYNCHRONOUS

  field(:SYNCHRONOUS, 0)
  field(:ASYNCHRONOUS, 1)
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          arn: String.t(),
          payload_passthrough: boolean,
          invocation_mode: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode.t()
        }
  defstruct [:arn, :payload_passthrough, :invocation_mode]

  field(:arn, 1, type: :string)
  field(:payload_passthrough, 2, type: :bool)

  field(:invocation_mode, 3,
    type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode,
    enum: true
  )
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          invoke_config: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.t() | nil
        }
  defstruct [:invoke_config]

  field(:invoke_config, 1, type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config)
end
