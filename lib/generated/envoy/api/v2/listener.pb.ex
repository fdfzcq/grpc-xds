defmodule Envoy.Api.V2.Listener.DrainType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :MODIFY_ONLY

  field(:DEFAULT, 0)
  field(:MODIFY_ONLY, 1)
end

defmodule Envoy.Api.V2.Listener.DeprecatedV1 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bind_to_port: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:bind_to_port]

  field(:bind_to_port, 1, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Listener.ConnectionBalanceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          balance_type: {atom, any}
        }
  defstruct [:balance_type]

  oneof(:balance_type, 0)

  field(:exact_balance, 1,
    type: Envoy.Api.V2.Listener.ConnectionBalanceConfig.ExactBalance,
    oneof: 0
  )
end

defmodule Envoy.Api.V2.Listener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          address: Envoy.Api.V2.Core.Address.t() | nil,
          filter_chains: [Envoy.Api.V2.Listener.FilterChain.t()],
          use_original_dst: Google.Protobuf.BoolValue.t() | nil,
          per_connection_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil,
          metadata: Envoy.Api.V2.Core.Metadata.t() | nil,
          deprecated_v1: Envoy.Api.V2.Listener.DeprecatedV1.t() | nil,
          drain_type: Envoy.Api.V2.Listener.DrainType.t(),
          listener_filters: [Envoy.Api.V2.Listener.ListenerFilter.t()],
          listener_filters_timeout: Google.Protobuf.Duration.t() | nil,
          continue_on_listener_filters_timeout: boolean,
          transparent: Google.Protobuf.BoolValue.t() | nil,
          freebind: Google.Protobuf.BoolValue.t() | nil,
          socket_options: [Envoy.Api.V2.Core.SocketOption.t()],
          tcp_fast_open_queue_length: Google.Protobuf.UInt32Value.t() | nil,
          traffic_direction: Envoy.Api.V2.Core.TrafficDirection.t(),
          udp_listener_config: Envoy.Api.V2.Listener.UdpListenerConfig.t() | nil,
          api_listener: Envoy.Config.Listener.V2.ApiListener.t() | nil,
          connection_balance_config: Envoy.Api.V2.Listener.ConnectionBalanceConfig.t() | nil,
          reuse_port: boolean,
          access_log: [Envoy.Config.Filter.Accesslog.V2.AccessLog.t()]
        }
  defstruct [
    :name,
    :address,
    :filter_chains,
    :use_original_dst,
    :per_connection_buffer_limit_bytes,
    :metadata,
    :deprecated_v1,
    :drain_type,
    :listener_filters,
    :listener_filters_timeout,
    :continue_on_listener_filters_timeout,
    :transparent,
    :freebind,
    :socket_options,
    :tcp_fast_open_queue_length,
    :traffic_direction,
    :udp_listener_config,
    :api_listener,
    :connection_balance_config,
    :reuse_port,
    :access_log
  ]

  field(:name, 1, type: :string)
  field(:address, 2, type: Envoy.Api.V2.Core.Address)
  field(:filter_chains, 3, repeated: true, type: Envoy.Api.V2.Listener.FilterChain)
  field(:use_original_dst, 4, type: Google.Protobuf.BoolValue, deprecated: true)
  field(:per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value)
  field(:metadata, 6, type: Envoy.Api.V2.Core.Metadata)
  field(:deprecated_v1, 7, type: Envoy.Api.V2.Listener.DeprecatedV1)
  field(:drain_type, 8, type: Envoy.Api.V2.Listener.DrainType, enum: true)
  field(:listener_filters, 9, repeated: true, type: Envoy.Api.V2.Listener.ListenerFilter)
  field(:listener_filters_timeout, 15, type: Google.Protobuf.Duration)
  field(:continue_on_listener_filters_timeout, 17, type: :bool)
  field(:transparent, 10, type: Google.Protobuf.BoolValue)
  field(:freebind, 11, type: Google.Protobuf.BoolValue)
  field(:socket_options, 13, repeated: true, type: Envoy.Api.V2.Core.SocketOption)
  field(:tcp_fast_open_queue_length, 12, type: Google.Protobuf.UInt32Value)
  field(:traffic_direction, 16, type: Envoy.Api.V2.Core.TrafficDirection, enum: true)
  field(:udp_listener_config, 18, type: Envoy.Api.V2.Listener.UdpListenerConfig)
  field(:api_listener, 19, type: Envoy.Config.Listener.V2.ApiListener)
  field(:connection_balance_config, 20, type: Envoy.Api.V2.Listener.ConnectionBalanceConfig)
  field(:reuse_port, 21, type: :bool)
  field(:access_log, 22, repeated: true, type: Envoy.Config.Filter.Accesslog.V2.AccessLog)
end
