defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          interface: String.t(),
          group: String.t(),
          version: String.t(),
          routes: [Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.Route.t()]
        }
  defstruct [:name, :interface, :group, :version, :routes]

  field(:name, 1, type: :string)
  field(:interface, 2, type: :string)
  field(:group, 3, type: :string)
  field(:version, 4, type: :string)

  field(:routes, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.Route
  )
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteMatch.t() | nil,
          route: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteAction.t() | nil
        }
  defstruct [:match, :route]

  field(:match, 1, type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          method: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.t() | nil,
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()]
        }
  defstruct [:method, :headers]

  field(:method, 1, type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch)
  field(:headers, 2, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_specifier: {atom, any}
        }
  defstruct [:cluster_specifier]

  oneof(:cluster_specifier, 0)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:weighted_clusters, 2, type: Envoy.Config.Route.V4alpha.WeightedCluster, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParameterMatchSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          parameter_match_specifier: {atom, any}
        }
  defstruct [:parameter_match_specifier]

  oneof(:parameter_match_specifier, 0)
  field(:exact_match, 3, type: :string, oneof: 0)
  field(:range_match, 4, type: Envoy.Type.V3.Int64Range, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParamsMatchEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: non_neg_integer,
          value:
            Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParameterMatchSpecifier.t()
            | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :uint32)

  field(:value, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParameterMatchSpecifier
  )
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: Envoy.Type.Matcher.V4alpha.StringMatcher.t() | nil,
          params_match: %{
            non_neg_integer =>
              Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParameterMatchSpecifier.t()
              | nil
          }
        }
  defstruct [:name, :params_match]

  field(:name, 1, type: Envoy.Type.Matcher.V4alpha.StringMatcher)

  field(:params_match, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V4alpha.MethodMatch.ParamsMatchEntry,
    map: true
  )
end
