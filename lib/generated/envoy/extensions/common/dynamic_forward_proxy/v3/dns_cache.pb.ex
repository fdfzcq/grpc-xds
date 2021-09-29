defmodule Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheCircuitBreakers do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_pending_requests: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:max_pending_requests]

  field(:max_pending_requests, 1, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          dns_lookup_family: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily.t(),
          dns_refresh_rate: Google.Protobuf.Duration.t() | nil,
          host_ttl: Google.Protobuf.Duration.t() | nil,
          max_hosts: Google.Protobuf.UInt32Value.t() | nil,
          dns_failure_refresh_rate: Envoy.Config.Cluster.V3.Cluster.RefreshRate.t() | nil,
          dns_cache_circuit_breaker:
            Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheCircuitBreakers.t() | nil,
          use_tcp_for_dns_lookups: boolean
        }
  defstruct [
    :name,
    :dns_lookup_family,
    :dns_refresh_rate,
    :host_ttl,
    :max_hosts,
    :dns_failure_refresh_rate,
    :dns_cache_circuit_breaker,
    :use_tcp_for_dns_lookups
  ]

  field(:name, 1, type: :string)
  field(:dns_lookup_family, 2, type: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily, enum: true)
  field(:dns_refresh_rate, 3, type: Google.Protobuf.Duration)
  field(:host_ttl, 4, type: Google.Protobuf.Duration)
  field(:max_hosts, 5, type: Google.Protobuf.UInt32Value)
  field(:dns_failure_refresh_rate, 6, type: Envoy.Config.Cluster.V3.Cluster.RefreshRate)

  field(:dns_cache_circuit_breaker, 7,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheCircuitBreakers
  )

  field(:use_tcp_for_dns_lookups, 8, type: :bool)
end
