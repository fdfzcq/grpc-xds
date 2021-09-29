defmodule Envoy.Config.Listener.V3.UdpListenerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          udp_listener_name: String.t()
        }
  defstruct [:config_type, :udp_listener_name]

  oneof(:config_type, 0)
  field(:udp_listener_name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Listener.V3.ActiveRawUdpListenerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
