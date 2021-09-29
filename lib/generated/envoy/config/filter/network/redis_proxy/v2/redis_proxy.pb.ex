defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.ReadPolicy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :MASTER | :PREFER_MASTER | :REPLICA | :PREFER_REPLICA | :ANY

  field(:MASTER, 0)
  field(:PREFER_MASTER, 1)
  field(:REPLICA, 2)
  field(:PREFER_REPLICA, 3)
  field(:ANY, 4)
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings do
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
            Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.ReadPolicy.t()
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
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.ReadPolicy,
    enum: true
  )
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: String.t(),
          runtime_fraction: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil,
          exclude_read_commands: boolean
        }
  defstruct [:cluster, :runtime_fraction, :exclude_read_commands]

  field(:cluster, 1, type: :string)
  field(:runtime_fraction, 2, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:exclude_read_commands, 3, type: :bool)
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          prefix: String.t(),
          remove_prefix: boolean,
          cluster: String.t(),
          request_mirror_policy: [
            Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy.t()
          ]
        }
  defstruct [:prefix, :remove_prefix, :cluster, :request_mirror_policy]

  field(:prefix, 1, type: :string)
  field(:remove_prefix, 2, type: :bool)
  field(:cluster, 3, type: :string)

  field(:request_mirror_policy, 4,
    repeated: true,
    type:
      Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy
  )
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          routes: [Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.t()],
          case_insensitive: boolean,
          catch_all_cluster: String.t(),
          catch_all_route:
            Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.t() | nil
        }
  defstruct [:routes, :case_insensitive, :catch_all_cluster, :catch_all_route]

  field(:routes, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route
  )

  field(:case_insensitive, 2, type: :bool)
  field(:catch_all_cluster, 3, type: :string, deprecated: true)

  field(:catch_all_route, 4,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route
  )
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          cluster: String.t(),
          settings:
            Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.t() | nil,
          latency_in_micros: boolean,
          prefix_routes:
            Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.t() | nil,
          downstream_auth_password: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [
    :stat_prefix,
    :cluster,
    :settings,
    :latency_in_micros,
    :prefix_routes,
    :downstream_auth_password
  ]

  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, deprecated: true)
  field(:settings, 3, type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings)
  field(:latency_in_micros, 4, type: :bool)

  field(:prefix_routes, 5, type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes)

  field(:downstream_auth_password, 6, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          auth_password: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [:auth_password]

  field(:auth_password, 1, type: Envoy.Api.V2.Core.DataSource)
end
