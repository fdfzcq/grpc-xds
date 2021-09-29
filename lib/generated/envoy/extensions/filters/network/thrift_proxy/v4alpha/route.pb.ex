defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          routes: [Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.Route.t()]
        }
  defstruct [:name, :routes]

  field(:name, 1, type: :string)

  field(:routes, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.Route
  )
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteMatch.t() | nil,
          route: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteAction.t() | nil
        }
  defstruct [:match, :route]

  field(:match, 1, type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match_specifier: {atom, any},
          invert: boolean,
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()]
        }
  defstruct [:match_specifier, :invert, :headers]

  oneof(:match_specifier, 0)
  field(:method_name, 1, type: :string, oneof: 0)
  field(:service_name, 2, type: :string, oneof: 0)
  field(:invert, 3, type: :bool)
  field(:headers, 4, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_specifier: {atom, any},
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          rate_limits: [Envoy.Config.Route.V4alpha.RateLimit.t()],
          strip_service_name: boolean
        }
  defstruct [:cluster_specifier, :metadata_match, :rate_limits, :strip_service_name]

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)

  field(:weighted_clusters, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster,
    oneof: 0
  )

  field(:cluster_header, 6, type: :string, oneof: 0)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:rate_limits, 4, repeated: true, type: Envoy.Config.Route.V4alpha.RateLimit)
  field(:strip_service_name, 5, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          weight: Google.Protobuf.UInt32Value.t() | nil,
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil
        }
  defstruct [:name, :weight, :metadata_match]

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [
            Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster.ClusterWeight.t()
          ]
        }
  defstruct [:clusters]

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.WeightedCluster.ClusterWeight
  )
end
