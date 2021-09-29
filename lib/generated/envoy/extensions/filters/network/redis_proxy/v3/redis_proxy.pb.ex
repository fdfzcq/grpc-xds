defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :MASTER | :PREFER_MASTER | :REPLICA | :PREFER_REPLICA | :ANY

  field(:MASTER, 0)
  field(:PREFER_MASTER, 1)
  field(:REPLICA, 2)
  field(:PREFER_REPLICA, 3)
  field(:ANY, 4)
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DELAY | :ERROR

  field(:DELAY, 0)
  field(:ERROR, 1)
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          op_timeout: Google.Protobuf.Duration.t() | nil,
          enable_hashtagging: boolean,
          enable_redirection: boolean,
          max_buffer_size_before_flush: non_neg_integer,
          buffer_flush_timeout: Google.Protobuf.Duration.t() | nil,
          max_upstream_unknown_connections: Google.Protobuf.UInt32Value.t() | nil,
          enable_command_stats: boolean,
          read_policy:
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy.t()
        }
  defstruct [
    :op_timeout,
    :enable_hashtagging,
    :enable_redirection,
    :max_buffer_size_before_flush,
    :buffer_flush_timeout,
    :max_upstream_unknown_connections,
    :enable_command_stats,
    :read_policy
  ]

  field(:op_timeout, 1, type: Google.Protobuf.Duration)
  field(:enable_hashtagging, 2, type: :bool)
  field(:enable_redirection, 3, type: :bool)
  field(:max_buffer_size_before_flush, 4, type: :uint32)
  field(:buffer_flush_timeout, 5, type: Google.Protobuf.Duration)
  field(:max_upstream_unknown_connections, 6, type: Google.Protobuf.UInt32Value)
  field(:enable_command_stats, 8, type: :bool)

  field(:read_policy, 7,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy,
    enum: true
  )
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: String.t(),
          runtime_fraction: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          exclude_read_commands: boolean
        }
  defstruct [:cluster, :runtime_fraction, :exclude_read_commands]

  field(:cluster, 1, type: :string)
  field(:runtime_fraction, 2, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:exclude_read_commands, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          prefix: String.t(),
          remove_prefix: boolean,
          cluster: String.t(),
          request_mirror_policy: [
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy.t()
          ]
        }
  defstruct [:prefix, :remove_prefix, :cluster, :request_mirror_policy]

  field(:prefix, 1, type: :string)
  field(:remove_prefix, 2, type: :bool)
  field(:cluster, 3, type: :string)

  field(:request_mirror_policy, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy
  )
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routes: [
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.t()
          ],
          case_insensitive: boolean,
          catch_all_route:
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.t() | nil
        }
  defstruct [:routes, :case_insensitive, :catch_all_route]

  field(:routes, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route
  )

  field(:case_insensitive, 2, type: :bool)

  field(:catch_all_route, 4,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route
  )
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fault_type:
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType.t(),
          fault_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          delay: Google.Protobuf.Duration.t() | nil,
          commands: [String.t()]
        }
  defstruct [:fault_type, :fault_enabled, :delay, :commands]

  field(:fault_type, 1,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType,
    enum: true
  )

  field(:fault_enabled, 2, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:delay, 3, type: Google.Protobuf.Duration)
  field(:commands, 4, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          settings:
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.t() | nil,
          latency_in_micros: boolean,
          prefix_routes:
            Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.t() | nil,
          downstream_auth_password: Envoy.Config.Core.V3.DataSource.t() | nil,
          faults: [Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.t()],
          downstream_auth_username: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [
    :stat_prefix,
    :settings,
    :latency_in_micros,
    :prefix_routes,
    :downstream_auth_password,
    :faults,
    :downstream_auth_username
  ]

  field(:stat_prefix, 1, type: :string)

  field(:settings, 3,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings
  )

  field(:latency_in_micros, 4, type: :bool)

  field(:prefix_routes, 5,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes
  )

  field(:downstream_auth_password, 6, type: Envoy.Config.Core.V3.DataSource)

  field(:faults, 8,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault
  )

  field(:downstream_auth_username, 7, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          auth_password: Envoy.Config.Core.V3.DataSource.t() | nil,
          auth_username: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [:auth_password, :auth_username]

  field(:auth_password, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:auth_username, 2, type: Envoy.Config.Core.V3.DataSource)
end
