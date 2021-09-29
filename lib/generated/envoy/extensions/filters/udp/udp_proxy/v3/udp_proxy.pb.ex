defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          policy_specifier: {atom, any}
        }
  defstruct [:policy_specifier]

  oneof(:policy_specifier, 0)
  field(:source_ip, 1, type: :bool, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route_specifier: {atom, any},
          stat_prefix: String.t(),
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          use_original_src_ip: boolean,
          hash_policies: [Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy.t()]
        }
  defstruct [:route_specifier, :stat_prefix, :idle_timeout, :use_original_src_ip, :hash_policies]

  oneof(:route_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)
  field(:idle_timeout, 3, type: Google.Protobuf.Duration)
  field(:use_original_src_ip, 4, type: :bool)

  field(:hash_policies, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy
  )
end
