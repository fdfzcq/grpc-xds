defmodule Envoy.Admin.V3.ServerInfo.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :LIVE | :DRAINING | :PRE_INITIALIZING | :INITIALIZING

  field(:LIVE, 0)
  field(:DRAINING, 1)
  field(:PRE_INITIALIZING, 2)
  field(:INITIALIZING, 3)
end

defmodule Envoy.Admin.V3.CommandLineOptions.IpVersion do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :v4 | :v6

  field(:v4, 0)
  field(:v6, 1)
end

defmodule Envoy.Admin.V3.CommandLineOptions.Mode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Serve | :Validate | :InitOnly

  field(:Serve, 0)
  field(:Validate, 1)
  field(:InitOnly, 2)
end

defmodule Envoy.Admin.V3.CommandLineOptions.DrainStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Gradual | :Immediate

  field(:Gradual, 0)
  field(:Immediate, 1)
end

defmodule Envoy.Admin.V3.ServerInfo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t(),
          state: Envoy.Admin.V3.ServerInfo.State.t(),
          uptime_current_epoch: Google.Protobuf.Duration.t() | nil,
          uptime_all_epochs: Google.Protobuf.Duration.t() | nil,
          hot_restart_version: String.t(),
          command_line_options: Envoy.Admin.V3.CommandLineOptions.t() | nil,
          node: Envoy.Config.Core.V3.Node.t() | nil
        }
  defstruct [
    :version,
    :state,
    :uptime_current_epoch,
    :uptime_all_epochs,
    :hot_restart_version,
    :command_line_options,
    :node
  ]

  field(:version, 1, type: :string)
  field(:state, 2, type: Envoy.Admin.V3.ServerInfo.State, enum: true)
  field(:uptime_current_epoch, 3, type: Google.Protobuf.Duration)
  field(:uptime_all_epochs, 4, type: Google.Protobuf.Duration)
  field(:hot_restart_version, 5, type: :string)
  field(:command_line_options, 6, type: Envoy.Admin.V3.CommandLineOptions)
  field(:node, 7, type: Envoy.Config.Core.V3.Node)
end

defmodule Envoy.Admin.V3.CommandLineOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          base_id: non_neg_integer,
          use_dynamic_base_id: boolean,
          base_id_path: String.t(),
          concurrency: non_neg_integer,
          config_path: String.t(),
          config_yaml: String.t(),
          allow_unknown_static_fields: boolean,
          reject_unknown_dynamic_fields: boolean,
          ignore_unknown_dynamic_fields: boolean,
          admin_address_path: String.t(),
          local_address_ip_version: Envoy.Admin.V3.CommandLineOptions.IpVersion.t(),
          log_level: String.t(),
          component_log_level: String.t(),
          log_format: String.t(),
          log_format_escaped: boolean,
          log_path: String.t(),
          service_cluster: String.t(),
          service_node: String.t(),
          service_zone: String.t(),
          file_flush_interval: Google.Protobuf.Duration.t() | nil,
          drain_time: Google.Protobuf.Duration.t() | nil,
          drain_strategy: Envoy.Admin.V3.CommandLineOptions.DrainStrategy.t(),
          parent_shutdown_time: Google.Protobuf.Duration.t() | nil,
          mode: Envoy.Admin.V3.CommandLineOptions.Mode.t(),
          disable_hot_restart: boolean,
          enable_mutex_tracing: boolean,
          restart_epoch: non_neg_integer,
          cpuset_threads: boolean,
          disabled_extensions: [String.t()],
          bootstrap_version: non_neg_integer,
          enable_fine_grain_logging: boolean,
          socket_path: String.t(),
          socket_mode: non_neg_integer
        }
  defstruct [
    :base_id,
    :use_dynamic_base_id,
    :base_id_path,
    :concurrency,
    :config_path,
    :config_yaml,
    :allow_unknown_static_fields,
    :reject_unknown_dynamic_fields,
    :ignore_unknown_dynamic_fields,
    :admin_address_path,
    :local_address_ip_version,
    :log_level,
    :component_log_level,
    :log_format,
    :log_format_escaped,
    :log_path,
    :service_cluster,
    :service_node,
    :service_zone,
    :file_flush_interval,
    :drain_time,
    :drain_strategy,
    :parent_shutdown_time,
    :mode,
    :disable_hot_restart,
    :enable_mutex_tracing,
    :restart_epoch,
    :cpuset_threads,
    :disabled_extensions,
    :bootstrap_version,
    :enable_fine_grain_logging,
    :socket_path,
    :socket_mode
  ]

  field(:base_id, 1, type: :uint64)
  field(:use_dynamic_base_id, 31, type: :bool)
  field(:base_id_path, 32, type: :string)
  field(:concurrency, 2, type: :uint32)
  field(:config_path, 3, type: :string)
  field(:config_yaml, 4, type: :string)
  field(:allow_unknown_static_fields, 5, type: :bool)
  field(:reject_unknown_dynamic_fields, 26, type: :bool)
  field(:ignore_unknown_dynamic_fields, 30, type: :bool)
  field(:admin_address_path, 6, type: :string)

  field(:local_address_ip_version, 7,
    type: Envoy.Admin.V3.CommandLineOptions.IpVersion,
    enum: true
  )

  field(:log_level, 8, type: :string)
  field(:component_log_level, 9, type: :string)
  field(:log_format, 10, type: :string)
  field(:log_format_escaped, 27, type: :bool)
  field(:log_path, 11, type: :string)
  field(:service_cluster, 13, type: :string)
  field(:service_node, 14, type: :string)
  field(:service_zone, 15, type: :string)
  field(:file_flush_interval, 16, type: Google.Protobuf.Duration)
  field(:drain_time, 17, type: Google.Protobuf.Duration)
  field(:drain_strategy, 33, type: Envoy.Admin.V3.CommandLineOptions.DrainStrategy, enum: true)
  field(:parent_shutdown_time, 18, type: Google.Protobuf.Duration)
  field(:mode, 19, type: Envoy.Admin.V3.CommandLineOptions.Mode, enum: true)
  field(:disable_hot_restart, 22, type: :bool)
  field(:enable_mutex_tracing, 23, type: :bool)
  field(:restart_epoch, 24, type: :uint32)
  field(:cpuset_threads, 25, type: :bool)
  field(:disabled_extensions, 28, repeated: true, type: :string)
  field(:bootstrap_version, 29, type: :uint32)
  field(:enable_fine_grain_logging, 34, type: :bool)
  field(:socket_path, 35, type: :string)
  field(:socket_mode, 36, type: :uint32)
end
