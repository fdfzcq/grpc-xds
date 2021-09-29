defmodule Envoy.Config.Core.V3.SocketAddress.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :TCP | :UDP

  field(:TCP, 0)
  field(:UDP, 1)
end

defmodule Envoy.Config.Core.V3.Pipe do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path: String.t(),
          mode: non_neg_integer
        }
  defstruct [:path, :mode]

  field(:path, 1, type: :string)
  field(:mode, 2, type: :uint32)
end

defmodule Envoy.Config.Core.V3.EnvoyInternalAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address_name_specifier: {atom, any}
        }
  defstruct [:address_name_specifier]

  oneof(:address_name_specifier, 0)
  field(:server_listener_name, 1, type: :string, oneof: 0)
end

defmodule Envoy.Config.Core.V3.SocketAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          port_specifier: {atom, any},
          protocol: Envoy.Config.Core.V3.SocketAddress.Protocol.t(),
          address: String.t(),
          resolver_name: String.t(),
          ipv4_compat: boolean
        }
  defstruct [:port_specifier, :protocol, :address, :resolver_name, :ipv4_compat]

  oneof(:port_specifier, 0)
  field(:protocol, 1, type: Envoy.Config.Core.V3.SocketAddress.Protocol, enum: true)
  field(:address, 2, type: :string)
  field(:port_value, 3, type: :uint32, oneof: 0)
  field(:named_port, 4, type: :string, oneof: 0)
  field(:resolver_name, 5, type: :string)
  field(:ipv4_compat, 6, type: :bool)
end

defmodule Envoy.Config.Core.V3.TcpKeepalive do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          keepalive_probes: Google.Protobuf.UInt32Value.t() | nil,
          keepalive_time: Google.Protobuf.UInt32Value.t() | nil,
          keepalive_interval: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:keepalive_probes, :keepalive_time, :keepalive_interval]

  field(:keepalive_probes, 1, type: Google.Protobuf.UInt32Value)
  field(:keepalive_time, 2, type: Google.Protobuf.UInt32Value)
  field(:keepalive_interval, 3, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Core.V3.BindConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          source_address: Envoy.Config.Core.V3.SocketAddress.t() | nil,
          freebind: Google.Protobuf.BoolValue.t() | nil,
          socket_options: [Envoy.Config.Core.V3.SocketOption.t()]
        }
  defstruct [:source_address, :freebind, :socket_options]

  field(:source_address, 1, type: Envoy.Config.Core.V3.SocketAddress)
  field(:freebind, 2, type: Google.Protobuf.BoolValue)
  field(:socket_options, 3, repeated: true, type: Envoy.Config.Core.V3.SocketOption)
end

defmodule Envoy.Config.Core.V3.Address do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: {atom, any}
        }
  defstruct [:address]

  oneof(:address, 0)
  field(:socket_address, 1, type: Envoy.Config.Core.V3.SocketAddress, oneof: 0)
  field(:pipe, 2, type: Envoy.Config.Core.V3.Pipe, oneof: 0)
  field(:envoy_internal_address, 3, type: Envoy.Config.Core.V3.EnvoyInternalAddress, oneof: 0)
end

defmodule Envoy.Config.Core.V3.CidrRange do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address_prefix: String.t(),
          prefix_len: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:address_prefix, :prefix_len]

  field(:address_prefix, 1, type: :string)
  field(:prefix_len, 2, type: Google.Protobuf.UInt32Value)
end
