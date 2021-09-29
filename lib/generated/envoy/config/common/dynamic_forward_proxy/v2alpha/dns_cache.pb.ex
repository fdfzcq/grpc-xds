defmodule Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          dns_lookup_family: Envoy.Api.V2.Cluster.DnsLookupFamily.t(),
          dns_refresh_rate: Google.Protobuf.Duration.t() | nil,
          host_ttl: Google.Protobuf.Duration.t() | nil,
          max_hosts: Google.Protobuf.UInt32Value.t() | nil,
          dns_failure_refresh_rate: Envoy.Api.V2.Cluster.RefreshRate.t() | nil
        }
  defstruct [
    :name,
    :dns_lookup_family,
    :dns_refresh_rate,
    :host_ttl,
    :max_hosts,
    :dns_failure_refresh_rate
  ]

  field(:name, 1, type: :string)
  field(:dns_lookup_family, 2, type: Envoy.Api.V2.Cluster.DnsLookupFamily, enum: true)
  field(:dns_refresh_rate, 3, type: Google.Protobuf.Duration)
  field(:host_ttl, 4, type: Google.Protobuf.Duration)
  field(:max_hosts, 5, type: Google.Protobuf.UInt32Value)
  field(:dns_failure_refresh_rate, 6, type: Envoy.Api.V2.Cluster.RefreshRate)
end
