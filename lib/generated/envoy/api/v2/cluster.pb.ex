defmodule Envoy.Api.V2.Cluster.DiscoveryType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :STATIC | :STRICT_DNS | :LOGICAL_DNS | :EDS | :ORIGINAL_DST

  field(:STATIC, 0)
  field(:STRICT_DNS, 1)
  field(:LOGICAL_DNS, 2)
  field(:EDS, 3)
  field(:ORIGINAL_DST, 4)
end

defmodule Envoy.Api.V2.Cluster.LbPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :ROUND_ROBIN
          | :LEAST_REQUEST
          | :RING_HASH
          | :RANDOM
          | :ORIGINAL_DST_LB
          | :MAGLEV
          | :CLUSTER_PROVIDED
          | :LOAD_BALANCING_POLICY_CONFIG

  field(:ROUND_ROBIN, 0)
  field(:LEAST_REQUEST, 1)
  field(:RING_HASH, 2)
  field(:RANDOM, 3)
  field(:ORIGINAL_DST_LB, 4)
  field(:MAGLEV, 5)
  field(:CLUSTER_PROVIDED, 6)
  field(:LOAD_BALANCING_POLICY_CONFIG, 7)
end

defmodule Envoy.Api.V2.Cluster.DnsLookupFamily do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO | :V4_ONLY | :V6_ONLY

  field(:AUTO, 0)
  field(:V4_ONLY, 1)
  field(:V6_ONLY, 2)
end

defmodule Envoy.Api.V2.Cluster.ClusterProtocolSelection do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :USE_CONFIGURED_PROTOCOL | :USE_DOWNSTREAM_PROTOCOL

  field(:USE_CONFIGURED_PROTOCOL, 0)
  field(:USE_DOWNSTREAM_PROTOCOL, 1)
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NO_FALLBACK | :ANY_ENDPOINT | :DEFAULT_SUBSET

  field(:NO_FALLBACK, 0)
  field(:ANY_ENDPOINT, 1)
  field(:DEFAULT_SUBSET, 2)
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer | :NOT_DEFINED | :NO_FALLBACK | :ANY_ENDPOINT | :DEFAULT_SUBSET | :KEYS_SUBSET

  field(:NOT_DEFINED, 0)
  field(:NO_FALLBACK, 1)
  field(:ANY_ENDPOINT, 2)
  field(:DEFAULT_SUBSET, 3)
  field(:KEYS_SUBSET, 4)
end

defmodule Envoy.Api.V2.Cluster.RingHashLbConfig.HashFunction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :XX_HASH | :MURMUR_HASH_2

  field(:XX_HASH, 0)
  field(:MURMUR_HASH_2, 1)
end

defmodule Envoy.Api.V2.Cluster.TransportSocketMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          match: Google.Protobuf.Struct.t() | nil,
          transport_socket: Envoy.Api.V2.Core.TransportSocket.t() | nil
        }
  defstruct [:name, :match, :transport_socket]

  field(:name, 1, type: :string)
  field(:match, 2, type: Google.Protobuf.Struct)
  field(:transport_socket, 3, type: Envoy.Api.V2.Core.TransportSocket)
end

defmodule Envoy.Api.V2.Cluster.CustomClusterType do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :typed_config]

  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Cluster.EdsClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          eds_config: Envoy.Api.V2.Core.ConfigSource.t() | nil,
          service_name: String.t()
        }
  defstruct [:eds_config, :service_name]

  field(:eds_config, 1, type: Envoy.Api.V2.Core.ConfigSource)
  field(:service_name, 2, type: :string)
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          keys: [String.t()],
          fallback_policy:
            Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy.t(),
          fallback_keys_subset: [String.t()]
        }
  defstruct [:keys, :fallback_policy, :fallback_keys_subset]

  field(:keys, 1, repeated: true, type: :string)

  field(:fallback_policy, 2,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    enum: true
  )

  field(:fallback_keys_subset, 3, repeated: true, type: :string)
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fallback_policy: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy.t(),
          default_subset: Google.Protobuf.Struct.t() | nil,
          subset_selectors: [Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.t()],
          locality_weight_aware: boolean,
          scale_locality_weight: boolean,
          panic_mode_any: boolean,
          list_as_any: boolean
        }
  defstruct [
    :fallback_policy,
    :default_subset,
    :subset_selectors,
    :locality_weight_aware,
    :scale_locality_weight,
    :panic_mode_any,
    :list_as_any
  ]

  field(:fallback_policy, 1,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy,
    enum: true
  )

  field(:default_subset, 2, type: Google.Protobuf.Struct)

  field(:subset_selectors, 3,
    repeated: true,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector
  )

  field(:locality_weight_aware, 4, type: :bool)
  field(:scale_locality_weight, 5, type: :bool)
  field(:panic_mode_any, 6, type: :bool)
  field(:list_as_any, 7, type: :bool)
end

defmodule Envoy.Api.V2.Cluster.LeastRequestLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          choice_count: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:choice_count]

  field(:choice_count, 1, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Cluster.RingHashLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          minimum_ring_size: Google.Protobuf.UInt64Value.t() | nil,
          hash_function: Envoy.Api.V2.Cluster.RingHashLbConfig.HashFunction.t(),
          maximum_ring_size: Google.Protobuf.UInt64Value.t() | nil
        }
  defstruct [:minimum_ring_size, :hash_function, :maximum_ring_size]

  field(:minimum_ring_size, 1, type: Google.Protobuf.UInt64Value)
  field(:hash_function, 3, type: Envoy.Api.V2.Cluster.RingHashLbConfig.HashFunction, enum: true)
  field(:maximum_ring_size, 4, type: Google.Protobuf.UInt64Value)
end

defmodule Envoy.Api.V2.Cluster.OriginalDstLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          use_http_header: boolean
        }
  defstruct [:use_http_header]

  field(:use_http_header, 1, type: :bool)
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.ZoneAwareLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routing_enabled: Envoy.Type.Percent.t() | nil,
          min_cluster_size: Google.Protobuf.UInt64Value.t() | nil,
          fail_traffic_on_panic: boolean
        }
  defstruct [:routing_enabled, :min_cluster_size, :fail_traffic_on_panic]

  field(:routing_enabled, 1, type: Envoy.Type.Percent)
  field(:min_cluster_size, 2, type: Google.Protobuf.UInt64Value)
  field(:fail_traffic_on_panic, 3, type: :bool)
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.LocalityWeightedLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.ConsistentHashingLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          use_hostname_for_hashing: boolean
        }
  defstruct [:use_hostname_for_hashing]

  field(:use_hostname_for_hashing, 1, type: :bool)
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality_config_specifier: {atom, any},
          healthy_panic_threshold: Envoy.Type.Percent.t() | nil,
          update_merge_window: Google.Protobuf.Duration.t() | nil,
          ignore_new_hosts_until_first_hc: boolean,
          close_connections_on_host_set_change: boolean,
          consistent_hashing_lb_config:
            Envoy.Api.V2.Cluster.CommonLbConfig.ConsistentHashingLbConfig.t() | nil
        }
  defstruct [
    :locality_config_specifier,
    :healthy_panic_threshold,
    :update_merge_window,
    :ignore_new_hosts_until_first_hc,
    :close_connections_on_host_set_change,
    :consistent_hashing_lb_config
  ]

  oneof(:locality_config_specifier, 0)
  field(:healthy_panic_threshold, 1, type: Envoy.Type.Percent)

  field(:zone_aware_lb_config, 2,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.ZoneAwareLbConfig,
    oneof: 0
  )

  field(:locality_weighted_lb_config, 3,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.LocalityWeightedLbConfig,
    oneof: 0
  )

  field(:update_merge_window, 4, type: Google.Protobuf.Duration)
  field(:ignore_new_hosts_until_first_hc, 5, type: :bool)
  field(:close_connections_on_host_set_change, 6, type: :bool)

  field(:consistent_hashing_lb_config, 7,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.ConsistentHashingLbConfig
  )
end

defmodule Envoy.Api.V2.Cluster.RefreshRate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          base_interval: Google.Protobuf.Duration.t() | nil,
          max_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:base_interval, :max_interval]

  field(:base_interval, 1, type: Google.Protobuf.Duration)
  field(:max_interval, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Api.V2.Cluster.ExtensionProtocolOptionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Cluster.TypedExtensionProtocolOptionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Any.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Cluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_discovery_type: {atom, any},
          lb_config: {atom, any},
          transport_socket_matches: [Envoy.Api.V2.Cluster.TransportSocketMatch.t()],
          name: String.t(),
          alt_stat_name: String.t(),
          eds_cluster_config: Envoy.Api.V2.Cluster.EdsClusterConfig.t() | nil,
          connect_timeout: Google.Protobuf.Duration.t() | nil,
          per_connection_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil,
          lb_policy: Envoy.Api.V2.Cluster.LbPolicy.t(),
          hosts: [Envoy.Api.V2.Core.Address.t()],
          load_assignment: Envoy.Api.V2.ClusterLoadAssignment.t() | nil,
          health_checks: [Envoy.Api.V2.Core.HealthCheck.t()],
          max_requests_per_connection: Google.Protobuf.UInt32Value.t() | nil,
          circuit_breakers: Envoy.Api.V2.Cluster.CircuitBreakers.t() | nil,
          tls_context: Envoy.Api.V2.Auth.UpstreamTlsContext.t() | nil,
          upstream_http_protocol_options: Envoy.Api.V2.Core.UpstreamHttpProtocolOptions.t() | nil,
          common_http_protocol_options: Envoy.Api.V2.Core.HttpProtocolOptions.t() | nil,
          http_protocol_options: Envoy.Api.V2.Core.Http1ProtocolOptions.t() | nil,
          http2_protocol_options: Envoy.Api.V2.Core.Http2ProtocolOptions.t() | nil,
          extension_protocol_options: %{String.t() => Google.Protobuf.Struct.t() | nil},
          typed_extension_protocol_options: %{String.t() => Google.Protobuf.Any.t() | nil},
          dns_refresh_rate: Google.Protobuf.Duration.t() | nil,
          dns_failure_refresh_rate: Envoy.Api.V2.Cluster.RefreshRate.t() | nil,
          respect_dns_ttl: boolean,
          dns_lookup_family: Envoy.Api.V2.Cluster.DnsLookupFamily.t(),
          dns_resolvers: [Envoy.Api.V2.Core.Address.t()],
          use_tcp_for_dns_lookups: boolean,
          outlier_detection: Envoy.Api.V2.Cluster.OutlierDetection.t() | nil,
          cleanup_interval: Google.Protobuf.Duration.t() | nil,
          upstream_bind_config: Envoy.Api.V2.Core.BindConfig.t() | nil,
          lb_subset_config: Envoy.Api.V2.Cluster.LbSubsetConfig.t() | nil,
          common_lb_config: Envoy.Api.V2.Cluster.CommonLbConfig.t() | nil,
          transport_socket: Envoy.Api.V2.Core.TransportSocket.t() | nil,
          metadata: Envoy.Api.V2.Core.Metadata.t() | nil,
          protocol_selection: Envoy.Api.V2.Cluster.ClusterProtocolSelection.t(),
          upstream_connection_options: Envoy.Api.V2.UpstreamConnectionOptions.t() | nil,
          close_connections_on_host_health_failure: boolean,
          drain_connections_on_host_removal: boolean,
          filters: [Envoy.Api.V2.Cluster.Filter.t()],
          load_balancing_policy: Envoy.Api.V2.LoadBalancingPolicy.t() | nil,
          lrs_server: Envoy.Api.V2.Core.ConfigSource.t() | nil,
          track_timeout_budgets: boolean
        }
  defstruct [
    :cluster_discovery_type,
    :lb_config,
    :transport_socket_matches,
    :name,
    :alt_stat_name,
    :eds_cluster_config,
    :connect_timeout,
    :per_connection_buffer_limit_bytes,
    :lb_policy,
    :hosts,
    :load_assignment,
    :health_checks,
    :max_requests_per_connection,
    :circuit_breakers,
    :tls_context,
    :upstream_http_protocol_options,
    :common_http_protocol_options,
    :http_protocol_options,
    :http2_protocol_options,
    :extension_protocol_options,
    :typed_extension_protocol_options,
    :dns_refresh_rate,
    :dns_failure_refresh_rate,
    :respect_dns_ttl,
    :dns_lookup_family,
    :dns_resolvers,
    :use_tcp_for_dns_lookups,
    :outlier_detection,
    :cleanup_interval,
    :upstream_bind_config,
    :lb_subset_config,
    :common_lb_config,
    :transport_socket,
    :metadata,
    :protocol_selection,
    :upstream_connection_options,
    :close_connections_on_host_health_failure,
    :drain_connections_on_host_removal,
    :filters,
    :load_balancing_policy,
    :lrs_server,
    :track_timeout_budgets
  ]

  oneof(:cluster_discovery_type, 0)
  oneof(:lb_config, 1)

  field(:transport_socket_matches, 43,
    repeated: true,
    type: Envoy.Api.V2.Cluster.TransportSocketMatch
  )

  field(:name, 1, type: :string)
  field(:alt_stat_name, 28, type: :string)
  field(:type, 2, type: Envoy.Api.V2.Cluster.DiscoveryType, enum: true, oneof: 0)
  field(:cluster_type, 38, type: Envoy.Api.V2.Cluster.CustomClusterType, oneof: 0)
  field(:eds_cluster_config, 3, type: Envoy.Api.V2.Cluster.EdsClusterConfig)
  field(:connect_timeout, 4, type: Google.Protobuf.Duration)
  field(:per_connection_buffer_limit_bytes, 5, type: Google.Protobuf.UInt32Value)
  field(:lb_policy, 6, type: Envoy.Api.V2.Cluster.LbPolicy, enum: true)
  field(:hosts, 7, repeated: true, type: Envoy.Api.V2.Core.Address, deprecated: true)
  field(:load_assignment, 33, type: Envoy.Api.V2.ClusterLoadAssignment)
  field(:health_checks, 8, repeated: true, type: Envoy.Api.V2.Core.HealthCheck)
  field(:max_requests_per_connection, 9, type: Google.Protobuf.UInt32Value)
  field(:circuit_breakers, 10, type: Envoy.Api.V2.Cluster.CircuitBreakers)
  field(:tls_context, 11, type: Envoy.Api.V2.Auth.UpstreamTlsContext, deprecated: true)
  field(:upstream_http_protocol_options, 46, type: Envoy.Api.V2.Core.UpstreamHttpProtocolOptions)
  field(:common_http_protocol_options, 29, type: Envoy.Api.V2.Core.HttpProtocolOptions)
  field(:http_protocol_options, 13, type: Envoy.Api.V2.Core.Http1ProtocolOptions)
  field(:http2_protocol_options, 14, type: Envoy.Api.V2.Core.Http2ProtocolOptions)

  field(:extension_protocol_options, 35,
    repeated: true,
    type: Envoy.Api.V2.Cluster.ExtensionProtocolOptionsEntry,
    deprecated: true,
    map: true
  )

  field(:typed_extension_protocol_options, 36,
    repeated: true,
    type: Envoy.Api.V2.Cluster.TypedExtensionProtocolOptionsEntry,
    map: true
  )

  field(:dns_refresh_rate, 16, type: Google.Protobuf.Duration)
  field(:dns_failure_refresh_rate, 44, type: Envoy.Api.V2.Cluster.RefreshRate)
  field(:respect_dns_ttl, 39, type: :bool)
  field(:dns_lookup_family, 17, type: Envoy.Api.V2.Cluster.DnsLookupFamily, enum: true)
  field(:dns_resolvers, 18, repeated: true, type: Envoy.Api.V2.Core.Address)
  field(:use_tcp_for_dns_lookups, 45, type: :bool)
  field(:outlier_detection, 19, type: Envoy.Api.V2.Cluster.OutlierDetection)
  field(:cleanup_interval, 20, type: Google.Protobuf.Duration)
  field(:upstream_bind_config, 21, type: Envoy.Api.V2.Core.BindConfig)
  field(:lb_subset_config, 22, type: Envoy.Api.V2.Cluster.LbSubsetConfig)
  field(:ring_hash_lb_config, 23, type: Envoy.Api.V2.Cluster.RingHashLbConfig, oneof: 1)
  field(:original_dst_lb_config, 34, type: Envoy.Api.V2.Cluster.OriginalDstLbConfig, oneof: 1)
  field(:least_request_lb_config, 37, type: Envoy.Api.V2.Cluster.LeastRequestLbConfig, oneof: 1)
  field(:common_lb_config, 27, type: Envoy.Api.V2.Cluster.CommonLbConfig)
  field(:transport_socket, 24, type: Envoy.Api.V2.Core.TransportSocket)
  field(:metadata, 25, type: Envoy.Api.V2.Core.Metadata)
  field(:protocol_selection, 26, type: Envoy.Api.V2.Cluster.ClusterProtocolSelection, enum: true)
  field(:upstream_connection_options, 30, type: Envoy.Api.V2.UpstreamConnectionOptions)
  field(:close_connections_on_host_health_failure, 31, type: :bool)
  field(:drain_connections_on_host_removal, 32, type: :bool)
  field(:filters, 40, repeated: true, type: Envoy.Api.V2.Cluster.Filter)
  field(:load_balancing_policy, 41, type: Envoy.Api.V2.LoadBalancingPolicy)
  field(:lrs_server, 42, type: Envoy.Api.V2.Core.ConfigSource)
  field(:track_timeout_budgets, 47, type: :bool)
end

defmodule Envoy.Api.V2.LoadBalancingPolicy.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          config: Google.Protobuf.Struct.t() | nil,
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :config, :typed_config]

  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true)
  field(:typed_config, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.LoadBalancingPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          policies: [Envoy.Api.V2.LoadBalancingPolicy.Policy.t()]
        }
  defstruct [:policies]

  field(:policies, 1, repeated: true, type: Envoy.Api.V2.LoadBalancingPolicy.Policy)
end

defmodule Envoy.Api.V2.UpstreamBindConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          source_address: Envoy.Api.V2.Core.Address.t() | nil
        }
  defstruct [:source_address]

  field(:source_address, 1, type: Envoy.Api.V2.Core.Address)
end

defmodule Envoy.Api.V2.UpstreamConnectionOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tcp_keepalive: Envoy.Api.V2.Core.TcpKeepalive.t() | nil
        }
  defstruct [:tcp_keepalive]

  field(:tcp_keepalive, 1, type: Envoy.Api.V2.Core.TcpKeepalive)
end
