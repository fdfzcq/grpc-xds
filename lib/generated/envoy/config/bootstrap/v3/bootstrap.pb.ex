defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :KILL | :MULTIKILL | :MEGAMISS | :MISS

  field(:UNKNOWN, 0)
  field(:KILL, 1)
  field(:MULTIKILL, 2)
  field(:MEGAMISS, 3)
  field(:MISS, 4)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          listeners: [Envoy.Config.Listener.V3.Listener.t()],
          clusters: [Envoy.Config.Cluster.V3.Cluster.t()],
          secrets: [Envoy.Extensions.TransportSockets.Tls.V3.Secret.t()]
        }
  defstruct [:listeners, :clusters, :secrets]

  field(:listeners, 1, repeated: true, type: Envoy.Config.Listener.V3.Listener)
  field(:clusters, 2, repeated: true, type: Envoy.Config.Cluster.V3.Cluster)
  field(:secrets, 3, repeated: true, type: Envoy.Extensions.TransportSockets.Tls.V3.Secret)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          lds_config: Envoy.Config.Core.V3.ConfigSource.t() | nil,
          lds_resources_locator: String.t(),
          cds_config: Envoy.Config.Core.V3.ConfigSource.t() | nil,
          cds_resources_locator: String.t(),
          ads_config: Envoy.Config.Core.V3.ApiConfigSource.t() | nil
        }
  defstruct [
    :lds_config,
    :lds_resources_locator,
    :cds_config,
    :cds_resources_locator,
    :ads_config
  ]

  field(:lds_config, 1, type: Envoy.Config.Core.V3.ConfigSource)
  field(:lds_resources_locator, 5, type: :string)
  field(:cds_config, 2, type: Envoy.Config.Core.V3.ConfigSource)
  field(:cds_resources_locator, 6, type: :string)
  field(:ads_config, 3, type: Envoy.Config.Core.V3.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stats_flush: {atom, any},
          node: Envoy.Config.Core.V3.Node.t() | nil,
          node_context_params: [String.t()],
          static_resources: Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources.t() | nil,
          dynamic_resources: Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources.t() | nil,
          cluster_manager: Envoy.Config.Bootstrap.V3.ClusterManager.t() | nil,
          hds_config: Envoy.Config.Core.V3.ApiConfigSource.t() | nil,
          flags_path: String.t(),
          stats_sinks: [Envoy.Config.Metrics.V3.StatsSink.t()],
          stats_config: Envoy.Config.Metrics.V3.StatsConfig.t() | nil,
          stats_flush_interval: Google.Protobuf.Duration.t() | nil,
          watchdog: Envoy.Config.Bootstrap.V3.Watchdog.t() | nil,
          watchdogs: Envoy.Config.Bootstrap.V3.Watchdogs.t() | nil,
          tracing: Envoy.Config.Trace.V3.Tracing.t() | nil,
          layered_runtime: Envoy.Config.Bootstrap.V3.LayeredRuntime.t() | nil,
          admin: Envoy.Config.Bootstrap.V3.Admin.t() | nil,
          overload_manager: Envoy.Config.Overload.V3.OverloadManager.t() | nil,
          enable_dispatcher_stats: boolean,
          header_prefix: String.t(),
          stats_server_version_override: Google.Protobuf.UInt64Value.t() | nil,
          use_tcp_for_dns_lookups: boolean,
          bootstrap_extensions: [Envoy.Config.Core.V3.TypedExtensionConfig.t()],
          fatal_actions: [Envoy.Config.Bootstrap.V3.FatalAction.t()],
          config_sources: [Envoy.Config.Core.V3.ConfigSource.t()],
          default_config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil,
          default_socket_interface: String.t(),
          certificate_provider_instances: %{
            String.t() => Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil
          }
        }
  defstruct [
    :stats_flush,
    :node,
    :node_context_params,
    :static_resources,
    :dynamic_resources,
    :cluster_manager,
    :hds_config,
    :flags_path,
    :stats_sinks,
    :stats_config,
    :stats_flush_interval,
    :watchdog,
    :watchdogs,
    :tracing,
    :layered_runtime,
    :admin,
    :overload_manager,
    :enable_dispatcher_stats,
    :header_prefix,
    :stats_server_version_override,
    :use_tcp_for_dns_lookups,
    :bootstrap_extensions,
    :fatal_actions,
    :config_sources,
    :default_config_source,
    :default_socket_interface,
    :certificate_provider_instances
  ]

  oneof(:stats_flush, 0)
  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:node_context_params, 26, repeated: true, type: :string)
  field(:static_resources, 2, type: Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources)
  field(:dynamic_resources, 3, type: Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources)
  field(:cluster_manager, 4, type: Envoy.Config.Bootstrap.V3.ClusterManager)
  field(:hds_config, 14, type: Envoy.Config.Core.V3.ApiConfigSource)
  field(:flags_path, 5, type: :string)
  field(:stats_sinks, 6, repeated: true, type: Envoy.Config.Metrics.V3.StatsSink)
  field(:stats_config, 13, type: Envoy.Config.Metrics.V3.StatsConfig)
  field(:stats_flush_interval, 7, type: Google.Protobuf.Duration)
  field(:stats_flush_on_admin, 29, type: :bool, oneof: 0)
  field(:watchdog, 8, type: Envoy.Config.Bootstrap.V3.Watchdog, deprecated: true)
  field(:watchdogs, 27, type: Envoy.Config.Bootstrap.V3.Watchdogs)
  field(:tracing, 9, type: Envoy.Config.Trace.V3.Tracing, deprecated: true)
  field(:layered_runtime, 17, type: Envoy.Config.Bootstrap.V3.LayeredRuntime)
  field(:admin, 12, type: Envoy.Config.Bootstrap.V3.Admin)
  field(:overload_manager, 15, type: Envoy.Config.Overload.V3.OverloadManager)
  field(:enable_dispatcher_stats, 16, type: :bool)
  field(:header_prefix, 18, type: :string)
  field(:stats_server_version_override, 19, type: Google.Protobuf.UInt64Value)
  field(:use_tcp_for_dns_lookups, 20, type: :bool)

  field(:bootstrap_extensions, 21, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:fatal_actions, 28, repeated: true, type: Envoy.Config.Bootstrap.V3.FatalAction)
  field(:config_sources, 22, repeated: true, type: Envoy.Config.Core.V3.ConfigSource)
  field(:default_config_source, 23, type: Envoy.Config.Core.V3.ConfigSource)
  field(:default_socket_interface, 24, type: :string)

  field(:certificate_provider_instances, 25,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry,
    map: true
  )
end

defmodule Envoy.Config.Bootstrap.V3.Admin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          access_log_path: String.t(),
          profile_path: String.t(),
          address: Envoy.Config.Core.V3.Address.t() | nil,
          socket_options: [Envoy.Config.Core.V3.SocketOption.t()]
        }
  defstruct [:access_log_path, :profile_path, :address, :socket_options]

  field(:access_log_path, 1, type: :string)
  field(:profile_path, 2, type: :string)
  field(:address, 3, type: Envoy.Config.Core.V3.Address)
  field(:socket_options, 4, repeated: true, type: Envoy.Config.Core.V3.SocketOption)
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event_log_path: String.t(),
          event_service: Envoy.Config.Core.V3.EventServiceConfig.t() | nil
        }
  defstruct [:event_log_path, :event_service]

  field(:event_log_path, 1, type: :string)
  field(:event_service, 2, type: Envoy.Config.Core.V3.EventServiceConfig)
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          local_cluster_name: String.t(),
          outlier_detection: Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection.t() | nil,
          upstream_bind_config: Envoy.Config.Core.V3.BindConfig.t() | nil,
          load_stats_config: Envoy.Config.Core.V3.ApiConfigSource.t() | nil
        }
  defstruct [:local_cluster_name, :outlier_detection, :upstream_bind_config, :load_stats_config]

  field(:local_cluster_name, 1, type: :string)
  field(:outlier_detection, 2, type: Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection)
  field(:upstream_bind_config, 3, type: Envoy.Config.Core.V3.BindConfig)
  field(:load_stats_config, 4, type: Envoy.Config.Core.V3.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.Watchdogs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          main_thread_watchdog: Envoy.Config.Bootstrap.V3.Watchdog.t() | nil,
          worker_watchdog: Envoy.Config.Bootstrap.V3.Watchdog.t() | nil
        }
  defstruct [:main_thread_watchdog, :worker_watchdog]

  field(:main_thread_watchdog, 1, type: Envoy.Config.Bootstrap.V3.Watchdog)
  field(:worker_watchdog, 2, type: Envoy.Config.Bootstrap.V3.Watchdog)
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil,
          event: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent.t()
        }
  defstruct [:config, :event]

  field(:config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:event, 2,
    type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent,
    enum: true
  )
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          actions: [Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.t()],
          miss_timeout: Google.Protobuf.Duration.t() | nil,
          megamiss_timeout: Google.Protobuf.Duration.t() | nil,
          kill_timeout: Google.Protobuf.Duration.t() | nil,
          max_kill_timeout_jitter: Google.Protobuf.Duration.t() | nil,
          multikill_timeout: Google.Protobuf.Duration.t() | nil,
          multikill_threshold: Envoy.Type.V3.Percent.t() | nil
        }
  defstruct [
    :actions,
    :miss_timeout,
    :megamiss_timeout,
    :kill_timeout,
    :max_kill_timeout_jitter,
    :multikill_timeout,
    :multikill_threshold
  ]

  field(:actions, 7, repeated: true, type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction)
  field(:miss_timeout, 1, type: Google.Protobuf.Duration)
  field(:megamiss_timeout, 2, type: Google.Protobuf.Duration)
  field(:kill_timeout, 3, type: Google.Protobuf.Duration)
  field(:max_kill_timeout_jitter, 6, type: Google.Protobuf.Duration)
  field(:multikill_timeout, 4, type: Google.Protobuf.Duration)
  field(:multikill_threshold, 5, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Config.Bootstrap.V3.FatalAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil
        }
  defstruct [:config]

  field(:config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end

defmodule Envoy.Config.Bootstrap.V3.Runtime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          symlink_root: String.t(),
          subdirectory: String.t(),
          override_subdirectory: String.t(),
          base: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:symlink_root, :subdirectory, :override_subdirectory, :base]

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 2, type: :string)
  field(:override_subdirectory, 3, type: :string)
  field(:base, 4, type: Google.Protobuf.Struct)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          symlink_root: String.t(),
          subdirectory: String.t(),
          append_service_cluster: boolean
        }
  defstruct [:symlink_root, :subdirectory, :append_service_cluster]

  field(:symlink_root, 1, type: :string)
  field(:subdirectory, 3, type: :string)
  field(:append_service_cluster, 2, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          rtds_config: Envoy.Config.Core.V3.ConfigSource.t() | nil
        }
  defstruct [:name, :rtds_config]

  field(:name, 1, type: :string)
  field(:rtds_config, 2, type: Envoy.Config.Core.V3.ConfigSource)
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          layer_specifier: {atom, any},
          name: String.t()
        }
  defstruct [:layer_specifier, :name]

  oneof(:layer_specifier, 0)
  field(:name, 1, type: :string)
  field(:static_layer, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:disk_layer, 3, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer, oneof: 0)
  field(:admin_layer, 4, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer, oneof: 0)
  field(:rtds_layer, 5, type: Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer, oneof: 0)
end

defmodule Envoy.Config.Bootstrap.V3.LayeredRuntime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          layers: [Envoy.Config.Bootstrap.V3.RuntimeLayer.t()]
        }
  defstruct [:layers]

  field(:layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V3.RuntimeLayer)
end
