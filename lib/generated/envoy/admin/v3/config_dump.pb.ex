defmodule Envoy.Admin.V3.ClientResourceStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :REQUESTED | :DOES_NOT_EXIST | :ACKED | :NACKED

  field(:UNKNOWN, 0)
  field(:REQUESTED, 1)
  field(:DOES_NOT_EXIST, 2)
  field(:ACKED, 3)
  field(:NACKED, 4)
end

defmodule Envoy.Admin.V3.ConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          configs: [Google.Protobuf.Any.t()]
        }
  defstruct [:configs]

  field(:configs, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V3.UpdateFailureState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_configuration: Google.Protobuf.Any.t() | nil,
          last_update_attempt: Google.Protobuf.Timestamp.t() | nil,
          details: String.t(),
          version_info: String.t()
        }
  defstruct [:failed_configuration, :last_update_attempt, :details, :version_info]

  field(:failed_configuration, 1, type: Google.Protobuf.Any)
  field(:last_update_attempt, 2, type: Google.Protobuf.Timestamp)
  field(:details, 3, type: :string)
  field(:version_info, 4, type: :string)
end

defmodule Envoy.Admin.V3.BootstrapConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bootstrap: Envoy.Config.Bootstrap.V3.Bootstrap.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:bootstrap, :last_updated]

  field(:bootstrap, 1, type: Envoy.Config.Bootstrap.V3.Bootstrap)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.StaticListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          listener: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:listener, :last_updated]

  field(:listener, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          listener: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:version_info, :listener, :last_updated]

  field(:version_info, 1, type: :string)
  field(:listener, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          active_state: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState.t() | nil,
          warming_state: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState.t() | nil,
          draining_state: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [:name, :active_state, :warming_state, :draining_state, :error_state, :client_status]

  field(:name, 1, type: :string)
  field(:active_state, 2, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:warming_state, 3, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:draining_state, 4, type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ListenersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          static_listeners: [Envoy.Admin.V3.ListenersConfigDump.StaticListener.t()],
          dynamic_listeners: [Envoy.Admin.V3.ListenersConfigDump.DynamicListener.t()]
        }
  defstruct [:version_info, :static_listeners, :dynamic_listeners]

  field(:version_info, 1, type: :string)

  field(:static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.StaticListener
  )

  field(:dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListener
  )
end

defmodule Envoy.Admin.V3.ClustersConfigDump.StaticCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:cluster, :last_updated]

  field(:cluster, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ClustersConfigDump.DynamicCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          cluster: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [:version_info, :cluster, :last_updated, :error_state, :client_status]

  field(:version_info, 1, type: :string)
  field(:cluster, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ClustersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          static_clusters: [Envoy.Admin.V3.ClustersConfigDump.StaticCluster.t()],
          dynamic_active_clusters: [Envoy.Admin.V3.ClustersConfigDump.DynamicCluster.t()],
          dynamic_warming_clusters: [Envoy.Admin.V3.ClustersConfigDump.DynamicCluster.t()]
        }
  defstruct [:version_info, :static_clusters, :dynamic_active_clusters, :dynamic_warming_clusters]

  field(:version_info, 1, type: :string)

  field(:static_clusters, 2, repeated: true, type: Envoy.Admin.V3.ClustersConfigDump.StaticCluster)

  field(:dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster
  )

  field(:dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster
  )
end

defmodule Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route_config: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:route_config, :last_updated]

  field(:route_config, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          route_config: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [:version_info, :route_config, :last_updated, :error_state, :client_status]

  field(:version_info, 1, type: :string)
  field(:route_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.RoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          static_route_configs: [Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig.t()],
          dynamic_route_configs: [Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig.t()]
        }
  defstruct [:static_route_configs, :dynamic_route_configs]

  field(:static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig
  )

  field(:dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig
  )
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          scoped_route_configs: [Google.Protobuf.Any.t()],
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:name, :scoped_route_configs, :last_updated]

  field(:name, 1, type: :string)
  field(:scoped_route_configs, 2, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          version_info: String.t(),
          scoped_route_configs: [Google.Protobuf.Any.t()],
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [
    :name,
    :version_info,
    :scoped_route_configs,
    :last_updated,
    :error_state,
    :client_status
  ]

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:scoped_route_configs, 3, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 4, type: Google.Protobuf.Timestamp)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          inline_scoped_route_configs: [
            Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs.t()
          ],
          dynamic_scoped_route_configs: [
            Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs.t()
          ]
        }
  defstruct [:inline_scoped_route_configs, :dynamic_scoped_route_configs]

  field(:inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs
  )

  field(:dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs
  )
end

defmodule Envoy.Admin.V3.SecretsConfigDump.DynamicSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          version_info: String.t(),
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          secret: Google.Protobuf.Any.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [:name, :version_info, :last_updated, :secret, :error_state, :client_status]

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:secret, 4, type: Google.Protobuf.Any)
  field(:error_state, 5, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 6, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.SecretsConfigDump.StaticSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          secret: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :last_updated, :secret]

  field(:name, 1, type: :string)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
  field(:secret, 3, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V3.SecretsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          static_secrets: [Envoy.Admin.V3.SecretsConfigDump.StaticSecret.t()],
          dynamic_active_secrets: [Envoy.Admin.V3.SecretsConfigDump.DynamicSecret.t()],
          dynamic_warming_secrets: [Envoy.Admin.V3.SecretsConfigDump.DynamicSecret.t()]
        }
  defstruct [:static_secrets, :dynamic_active_secrets, :dynamic_warming_secrets]

  field(:static_secrets, 1, repeated: true, type: Envoy.Admin.V3.SecretsConfigDump.StaticSecret)

  field(:dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret
  )

  field(:dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V3.SecretsConfigDump.DynamicSecret
  )
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint_config: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:endpoint_config, :last_updated]

  field(:endpoint_config, 1, type: Google.Protobuf.Any)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          endpoint_config: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          error_state: Envoy.Admin.V3.UpdateFailureState.t() | nil,
          client_status: Envoy.Admin.V3.ClientResourceStatus.t()
        }
  defstruct [:version_info, :endpoint_config, :last_updated, :error_state, :client_status]

  field(:version_info, 1, type: :string)
  field(:endpoint_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:error_state, 4, type: Envoy.Admin.V3.UpdateFailureState)
  field(:client_status, 5, type: Envoy.Admin.V3.ClientResourceStatus, enum: true)
end

defmodule Envoy.Admin.V3.EndpointsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          static_endpoint_configs: [Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig.t()],
          dynamic_endpoint_configs: [Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig.t()]
        }
  defstruct [:static_endpoint_configs, :dynamic_endpoint_configs]

  field(:static_endpoint_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig
  )

  field(:dynamic_endpoint_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig
  )
end
