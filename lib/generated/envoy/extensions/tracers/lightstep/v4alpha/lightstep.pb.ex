defmodule Envoy.Extensions.Tracers.Lightstep.V4alpha.LightstepConfig.PropagationMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ENVOY | :LIGHTSTEP | :B3 | :TRACE_CONTEXT

  field(:ENVOY, 0)
  field(:LIGHTSTEP, 1)
  field(:B3, 2)
  field(:TRACE_CONTEXT, 3)
end

defmodule Envoy.Extensions.Tracers.Lightstep.V4alpha.LightstepConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          collector_cluster: String.t(),
          access_token_file: String.t(),
          propagation_modes: [
            [Envoy.Extensions.Tracers.Lightstep.V4alpha.LightstepConfig.PropagationMode.t()]
          ]
        }
  defstruct [:collector_cluster, :access_token_file, :propagation_modes]

  field(:collector_cluster, 1, type: :string)
  field(:access_token_file, 2, type: :string)

  field(:propagation_modes, 3,
    repeated: true,
    type: Envoy.Extensions.Tracers.Lightstep.V4alpha.LightstepConfig.PropagationMode,
    enum: true
  )
end
