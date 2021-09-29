defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UNSPECIFIED
          | :HTTP_DOWNSTREAM_CONNECTION_IDLE
          | :HTTP_DOWNSTREAM_STREAM_IDLE
          | :TRANSPORT_SOCKET_CONNECT

  field(:UNSPECIFIED, 0)
  field(:HTTP_DOWNSTREAM_CONNECTION_IDLE, 1)
  field(:HTTP_DOWNSTREAM_STREAM_IDLE, 2)
  field(:TRANSPORT_SOCKET_CONNECT, 3)
end

defmodule Envoy.Config.Overload.V3.ResourceMonitor do
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

defmodule Envoy.Config.Overload.V3.ThresholdTrigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:value]

  field(:value, 1, type: :double)
end

defmodule Envoy.Config.Overload.V3.ScaledTrigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scaling_threshold: float | :infinity | :negative_infinity | :nan,
          saturation_threshold: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:scaling_threshold, :saturation_threshold]

  field(:scaling_threshold, 1, type: :double)
  field(:saturation_threshold, 2, type: :double)
end

defmodule Envoy.Config.Overload.V3.Trigger do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          trigger_oneof: {atom, any},
          name: String.t()
        }
  defstruct [:trigger_oneof, :name]

  oneof(:trigger_oneof, 0)
  field(:name, 1, type: :string)
  field(:threshold, 2, type: Envoy.Config.Overload.V3.ThresholdTrigger, oneof: 0)
  field(:scaled, 3, type: Envoy.Config.Overload.V3.ScaledTrigger, oneof: 0)
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          overload_adjust: {atom, any},
          timer: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType.t()
        }
  defstruct [:overload_adjust, :timer]

  oneof(:overload_adjust, 0)

  field(:timer, 1,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.TimerType,
    enum: true
  )

  field(:min_timeout, 2, type: Google.Protobuf.Duration, oneof: 0)
  field(:min_scale, 3, type: Envoy.Type.V3.Percent, oneof: 0)
end

defmodule Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          timer_scale_factors: [
            Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer.t()
          ]
        }
  defstruct [:timer_scale_factors]

  field(:timer_scale_factors, 1,
    repeated: true,
    type: Envoy.Config.Overload.V3.ScaleTimersOverloadActionConfig.ScaleTimer
  )
end

defmodule Envoy.Config.Overload.V3.OverloadAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          triggers: [Envoy.Config.Overload.V3.Trigger.t()],
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :triggers, :typed_config]

  field(:name, 1, type: :string)
  field(:triggers, 2, repeated: true, type: Envoy.Config.Overload.V3.Trigger)
  field(:typed_config, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Overload.V3.OverloadManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          refresh_interval: Google.Protobuf.Duration.t() | nil,
          resource_monitors: [Envoy.Config.Overload.V3.ResourceMonitor.t()],
          actions: [Envoy.Config.Overload.V3.OverloadAction.t()]
        }
  defstruct [:refresh_interval, :resource_monitors, :actions]

  field(:refresh_interval, 1, type: Google.Protobuf.Duration)
  field(:resource_monitors, 2, repeated: true, type: Envoy.Config.Overload.V3.ResourceMonitor)
  field(:actions, 3, repeated: true, type: Envoy.Config.Overload.V3.OverloadAction)
end
