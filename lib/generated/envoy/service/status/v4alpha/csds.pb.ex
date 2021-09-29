defmodule Envoy.Service.Status.V4alpha.ConfigStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :SYNCED | :NOT_SENT | :STALE | :ERROR

  field(:UNKNOWN, 0)
  field(:SYNCED, 1)
  field(:NOT_SENT, 2)
  field(:STALE, 3)
  field(:ERROR, 4)
end

defmodule Envoy.Service.Status.V4alpha.ClientConfigStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :CLIENT_UNKNOWN | :CLIENT_REQUESTED | :CLIENT_ACKED | :CLIENT_NACKED

  field(:CLIENT_UNKNOWN, 0)
  field(:CLIENT_REQUESTED, 1)
  field(:CLIENT_ACKED, 2)
  field(:CLIENT_NACKED, 3)
end

defmodule Envoy.Service.Status.V4alpha.ClientStatusRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_matchers: [Envoy.Type.Matcher.V4alpha.NodeMatcher.t()],
          node: Envoy.Config.Core.V4alpha.Node.t() | nil
        }
  defstruct [:node_matchers, :node]

  field(:node_matchers, 1, repeated: true, type: Envoy.Type.Matcher.V4alpha.NodeMatcher)
  field(:node, 2, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Service.Status.V4alpha.PerXdsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          per_xds_config: {atom, any},
          status: Envoy.Service.Status.V4alpha.ConfigStatus.t()
        }
  defstruct [:per_xds_config, :status]

  oneof(:per_xds_config, 0)
  field(:status, 1, type: Envoy.Service.Status.V4alpha.ConfigStatus, enum: true)
  field(:listener_config, 2, type: Envoy.Admin.V4alpha.ListenersConfigDump, oneof: 0)
  field(:cluster_config, 3, type: Envoy.Admin.V4alpha.ClustersConfigDump, oneof: 0)
  field(:route_config, 4, type: Envoy.Admin.V4alpha.RoutesConfigDump, oneof: 0)
  field(:scoped_route_config, 5, type: Envoy.Admin.V4alpha.ScopedRoutesConfigDump, oneof: 0)
  field(:endpoint_config, 6, type: Envoy.Admin.V4alpha.EndpointsConfigDump, oneof: 0)
end

defmodule Envoy.Service.Status.V4alpha.ClientConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V4alpha.Node.t() | nil,
          xds_config: [Envoy.Service.Status.V4alpha.PerXdsConfig.t()]
        }
  defstruct [:node, :xds_config]

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
  field(:xds_config, 2, repeated: true, type: Envoy.Service.Status.V4alpha.PerXdsConfig)
end

defmodule Envoy.Service.Status.V4alpha.ClientStatusResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: [Envoy.Service.Status.V4alpha.ClientConfig.t()]
        }
  defstruct [:config]

  field(:config, 1, repeated: true, type: Envoy.Service.Status.V4alpha.ClientConfig)
end
