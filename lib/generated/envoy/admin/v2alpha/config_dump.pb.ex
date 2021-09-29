defmodule Envoy.Admin.V2alpha.ConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          configs: [Google.Protobuf.Any.t()]
        }
  defstruct [:configs]

  field(:configs, 1, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V2alpha.UpdateFailureState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failed_configuration: Google.Protobuf.Any.t() | nil,
          last_update_attempt: Google.Protobuf.Timestamp.t() | nil,
          details: String.t()
        }
  defstruct [:failed_configuration, :last_update_attempt, :details]

  field(:failed_configuration, 1, type: Google.Protobuf.Any)
  field(:last_update_attempt, 2, type: Google.Protobuf.Timestamp)
  field(:details, 3, type: :string)
end

defmodule Envoy.Admin.V2alpha.BootstrapConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bootstrap: Envoy.Config.Bootstrap.V2.Bootstrap.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:bootstrap, :last_updated]

  field(:bootstrap, 1, type: Envoy.Config.Bootstrap.V2.Bootstrap)
  field(:last_updated, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener do
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

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState do
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

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          active_state: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState.t() | nil,
          warming_state: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState.t() | nil,
          draining_state: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState.t() | nil,
          error_state: Envoy.Admin.V2alpha.UpdateFailureState.t() | nil
        }
  defstruct [:name, :active_state, :warming_state, :draining_state, :error_state]

  field(:name, 1, type: :string)
  field(:active_state, 2, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:warming_state, 3, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:draining_state, 4, type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState)
  field(:error_state, 5, type: Envoy.Admin.V2alpha.UpdateFailureState)
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          static_listeners: [Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener.t()],
          dynamic_listeners: [Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener.t()]
        }
  defstruct [:version_info, :static_listeners, :dynamic_listeners]

  field(:version_info, 1, type: :string)

  field(:static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener
  )

  field(:dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener
  )
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster do
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

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          cluster: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:version_info, :cluster, :last_updated]

  field(:version_info, 1, type: :string)
  field(:cluster, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          static_clusters: [Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster.t()],
          dynamic_active_clusters: [Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster.t()],
          dynamic_warming_clusters: [Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster.t()]
        }
  defstruct [:version_info, :static_clusters, :dynamic_active_clusters, :dynamic_warming_clusters]

  field(:version_info, 1, type: :string)

  field(:static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster
  )

  field(:dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster
  )

  field(:dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster
  )
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig do
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

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          route_config: Google.Protobuf.Any.t() | nil,
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:version_info, :route_config, :last_updated]

  field(:version_info, 1, type: :string)
  field(:route_config, 2, type: Google.Protobuf.Any)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          static_route_configs: [Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig.t()],
          dynamic_route_configs: [Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig.t()]
        }
  defstruct [:static_route_configs, :dynamic_route_configs]

  field(:static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig
  )

  field(:dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig
  )
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
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

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          version_info: String.t(),
          scoped_route_configs: [Google.Protobuf.Any.t()],
          last_updated: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:name, :version_info, :scoped_route_configs, :last_updated]

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:scoped_route_configs, 3, repeated: true, type: Google.Protobuf.Any)
  field(:last_updated, 4, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          inline_scoped_route_configs: [
            Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs.t()
          ],
          dynamic_scoped_route_configs: [
            Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs.t()
          ]
        }
  defstruct [:inline_scoped_route_configs, :dynamic_scoped_route_configs]

  field(:inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs
  )

  field(:dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs
  )
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          version_info: String.t(),
          last_updated: Google.Protobuf.Timestamp.t() | nil,
          secret: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :version_info, :last_updated, :secret]

  field(:name, 1, type: :string)
  field(:version_info, 2, type: :string)
  field(:last_updated, 3, type: Google.Protobuf.Timestamp)
  field(:secret, 4, type: Google.Protobuf.Any)
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret do
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

defmodule Envoy.Admin.V2alpha.SecretsConfigDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          static_secrets: [Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret.t()],
          dynamic_active_secrets: [Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret.t()],
          dynamic_warming_secrets: [Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret.t()]
        }
  defstruct [:static_secrets, :dynamic_active_secrets, :dynamic_warming_secrets]

  field(:static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret
  )

  field(:dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret
  )

  field(:dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret
  )
end
