defmodule Envoy.Config.Filter.Fault.V2.FaultDelay.FaultDelayType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :FIXED

  field(:FIXED, 0)
end

defmodule Envoy.Config.Filter.Fault.V2.FaultDelay.HeaderDelay do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Fault.V2.FaultDelay do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fault_delay_secifier: {atom, any},
          type: Envoy.Config.Filter.Fault.V2.FaultDelay.FaultDelayType.t(),
          percentage: Envoy.Type.FractionalPercent.t() | nil
        }
  defstruct [:fault_delay_secifier, :type, :percentage]

  oneof(:fault_delay_secifier, 0)

  field(:type, 1,
    type: Envoy.Config.Filter.Fault.V2.FaultDelay.FaultDelayType,
    deprecated: true,
    enum: true
  )

  field(:fixed_delay, 3, type: Google.Protobuf.Duration, oneof: 0)
  field(:header_delay, 5, type: Envoy.Config.Filter.Fault.V2.FaultDelay.HeaderDelay, oneof: 0)
  field(:percentage, 4, type: Envoy.Type.FractionalPercent)
end

defmodule Envoy.Config.Filter.Fault.V2.FaultRateLimit.FixedLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit_kbps: non_neg_integer
        }
  defstruct [:limit_kbps]

  field(:limit_kbps, 1, type: :uint64)
end

defmodule Envoy.Config.Filter.Fault.V2.FaultRateLimit.HeaderLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Fault.V2.FaultRateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          limit_type: {atom, any},
          percentage: Envoy.Type.FractionalPercent.t() | nil
        }
  defstruct [:limit_type, :percentage]

  oneof(:limit_type, 0)
  field(:fixed_limit, 1, type: Envoy.Config.Filter.Fault.V2.FaultRateLimit.FixedLimit, oneof: 0)
  field(:header_limit, 3, type: Envoy.Config.Filter.Fault.V2.FaultRateLimit.HeaderLimit, oneof: 0)
  field(:percentage, 2, type: Envoy.Type.FractionalPercent)
end
