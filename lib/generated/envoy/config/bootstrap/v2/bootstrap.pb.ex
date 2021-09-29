defmodule Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          listeners: [Envoy.Api.V2.Listener.t()],
          clusters: [Envoy.Api.V2.Cluster.t()],
          secrets: [Envoy.Api.V2.Auth.Secret.t()]
        }
  defstruct [:listeners, :clusters, :secrets]

  field(:listeners, 1, repeated: true, type: Envoy.Api.V2.Listener)
  field(:clusters, 2, repeated: true, type: Envoy.Api.V2.Cluster)
  field(:secrets, 3, repeated: true, type: Envoy.Api.V2.Auth.Secret)
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          lds_config: Envoy.Api.V2.Core.ConfigSource.t() | nil,
          cds_config: Envoy.Api.V2.Core.ConfigSource.t() | nil,
          ads_config: Envoy.Api.V2.Core.ApiConfigSource.t() | nil
        }
  defstruct [:lds_config, :cds_config, :ads_config]

  field(:lds_config, 1, type: Envoy.Api.V2.Core.ConfigSource)
  field(:cds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
  field(:ads_config, 3, type: Envoy.Api.V2.Core.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.Bootstrap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Api.V2.Core.Node.t() | nil,
          static_resources: Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources.t() | nil,
          dynamic_resources: Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources.t() | nil,
          cluster_manager: Envoy.Config.Bootstrap.V2.ClusterManager.t() | nil,
          hds_config: Envoy.Api.V2.Core.ApiConfigSource.t() | nil,
          flags_path: String.t(),
          stats_sinks: [Envoy.Config.Metrics.V2.StatsSink.t()],
          stats_config: Envoy.Config.Metrics.V2.StatsConfig.t() | nil,
          stats_flush_interval: Google.Protobuf.Duration.t() | nil,
          watchdog: Envoy.Config.Bootstrap.V2.Watchdog.t() | nil,
          tracing: Envoy.Config.Trace.V2.Tracing.t() | nil,
          runtime: Envoy.Config.Bootstrap.V2.Runtime.t() | nil,
          layered_runtime: Envoy.Config.Bootstrap.V2.LayeredRuntime.t() | nil,
          admin: Envoy.Config.Bootstrap.V2.Admin.t() | nil,
          overload_manager: Envoy.Config.Overload.V2alpha.OverloadManager.t() | nil,
          enable_dispatcher_stats: boolean,
          header_prefix: String.t(),
          stats_server_version_override: Google.Protobuf.UInt64Value.t() | nil,
          use_tcp_for_dns_lookups: boolean
        }
  defstruct [
    :node,
    :static_resources,
    :dynamic_resources,
    :cluster_manager,
    :hds_config,
    :flags_path,
    :stats_sinks,
    :stats_config,
    :stats_flush_interval,
    :watchdog,
    :tracing,
    :runtime,
    :layered_runtime,
    :admin,
    :overload_manager,
    :enable_dispatcher_stats,
    :header_prefix,
    :stats_server_version_override,
    :use_tcp_for_dns_lookups
  ]

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:static_resources, 2, type: Envoy.Config.Bootstrap.V2.Bootstrap.StaticResources)
  field(:dynamic_resources, 3, type: Envoy.Config.Bootstrap.V2.Bootstrap.DynamicResources)
  field(:cluster_manager, 4, type: Envoy.Config.Bootstrap.V2.ClusterManager)
  field(:hds_config, 14, type: Envoy.Api.V2.Core.ApiConfigSource)
  field(:flags_path, 5, type: :string)
  field(:stats_sinks, 6, repeated: true, type: Envoy.Config.Metrics.V2.StatsSink)
  field(:stats_config, 13, type: Envoy.Config.Metrics.V2.StatsConfig)
  field(:stats_flush_interval, 7, type: Google.Protobuf.Duration)
  field(:watchdog, 8, type: Envoy.Config.Bootstrap.V2.Watchdog)
  field(:tracing, 9, type: Envoy.Config.Trace.V2.Tracing)
  field(:runtime, 11, type: Envoy.Config.Bootstrap.V2.Runtime, deprecated: true)
  field(:layered_runtime, 17, type: Envoy.Config.Bootstrap.V2.LayeredRuntime)
  field(:admin, 12, type: Envoy.Config.Bootstrap.V2.Admin)
  field(:overload_manager, 15, type: Envoy.Config.Overload.V2alpha.OverloadManager)
  field(:enable_dispatcher_stats, 16, type: :bool)
  field(:header_prefix, 18, type: :string)
  field(:stats_server_version_override, 19, type: Google.Protobuf.UInt64Value)
  field(:use_tcp_for_dns_lookups, 20, type: :bool)
end

defmodule Envoy.Config.Bootstrap.V2.Admin do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          access_log_path: String.t(),
          profile_path: String.t(),
          address: Envoy.Api.V2.Core.Address.t() | nil,
          socket_options: [Envoy.Api.V2.Core.SocketOption.t()]
        }
  defstruct [:access_log_path, :profile_path, :address, :socket_options]

  field(:access_log_path, 1, type: :string)
  field(:profile_path, 2, type: :string)
  field(:address, 3, type: Envoy.Api.V2.Core.Address)
  field(:socket_options, 4, repeated: true, type: Envoy.Api.V2.Core.SocketOption)
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event_log_path: String.t(),
          event_service: Envoy.Api.V2.Core.EventServiceConfig.t() | nil
        }
  defstruct [:event_log_path, :event_service]

  field(:event_log_path, 1, type: :string)
  field(:event_service, 2, type: Envoy.Api.V2.Core.EventServiceConfig)
end

defmodule Envoy.Config.Bootstrap.V2.ClusterManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          local_cluster_name: String.t(),
          outlier_detection: Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection.t() | nil,
          upstream_bind_config: Envoy.Api.V2.Core.BindConfig.t() | nil,
          load_stats_config: Envoy.Api.V2.Core.ApiConfigSource.t() | nil
        }
  defstruct [:local_cluster_name, :outlier_detection, :upstream_bind_config, :load_stats_config]

  field(:local_cluster_name, 1, type: :string)
  field(:outlier_detection, 2, type: Envoy.Config.Bootstrap.V2.ClusterManager.OutlierDetection)
  field(:upstream_bind_config, 3, type: Envoy.Api.V2.Core.BindConfig)
  field(:load_stats_config, 4, type: Envoy.Api.V2.Core.ApiConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.Watchdog do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          miss_timeout: Google.Protobuf.Duration.t() | nil,
          megamiss_timeout: Google.Protobuf.Duration.t() | nil,
          kill_timeout: Google.Protobuf.Duration.t() | nil,
          multikill_timeout: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:miss_timeout, :megamiss_timeout, :kill_timeout, :multikill_timeout]

  field(:miss_timeout, 1, type: Google.Protobuf.Duration)
  field(:megamiss_timeout, 2, type: Google.Protobuf.Duration)
  field(:kill_timeout, 3, type: Google.Protobuf.Duration)
  field(:multikill_timeout, 4, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Bootstrap.V2.Runtime do
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

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer do
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

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          rtds_config: Envoy.Api.V2.Core.ConfigSource.t() | nil
        }
  defstruct [:name, :rtds_config]

  field(:name, 1, type: :string)
  field(:rtds_config, 2, type: Envoy.Api.V2.Core.ConfigSource)
end

defmodule Envoy.Config.Bootstrap.V2.RuntimeLayer do
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
  field(:disk_layer, 3, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.DiskLayer, oneof: 0)
  field(:admin_layer, 4, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.AdminLayer, oneof: 0)
  field(:rtds_layer, 5, type: Envoy.Config.Bootstrap.V2.RuntimeLayer.RtdsLayer, oneof: 0)
end

defmodule Envoy.Config.Bootstrap.V2.LayeredRuntime do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          layers: [Envoy.Config.Bootstrap.V2.RuntimeLayer.t()]
        }
  defstruct [:layers]

  field(:layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V2.RuntimeLayer)
end
