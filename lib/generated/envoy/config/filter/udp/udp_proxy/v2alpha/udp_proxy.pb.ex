defmodule Envoy.Config.Filter.Udp.UdpProxy.V2alpha.UdpProxyConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route_specifier: {atom, any},
          stat_prefix: String.t(),
          idle_timeout: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:route_specifier, :stat_prefix, :idle_timeout]

  oneof(:route_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)
  field(:idle_timeout, 3, type: Google.Protobuf.Duration)
end
