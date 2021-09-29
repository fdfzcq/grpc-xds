defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          routes: [Envoy.Extensions.Filters.Network.RocketmqProxy.V3.Route.t()]
        }
  defstruct [:name, :routes]

  field(:name, 1, type: :string)
  field(:routes, 2, repeated: true, type: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.Route)
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V3.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteMatch.t() | nil,
          route: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteAction.t() | nil
        }
  defstruct [:match, :route]

  field(:match, 1, type: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteMatch)
  field(:route, 2, type: Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteAction)
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          topic: Envoy.Type.Matcher.V3.StringMatcher.t() | nil,
          headers: [Envoy.Config.Route.V3.HeaderMatcher.t()]
        }
  defstruct [:topic, :headers]

  field(:topic, 1, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:headers, 2, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher)
end

defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V3.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: String.t(),
          metadata_match: Envoy.Config.Core.V3.Metadata.t() | nil
        }
  defstruct [:cluster, :metadata_match]

  field(:cluster, 1, type: :string)
  field(:metadata_match, 2, type: Envoy.Config.Core.V3.Metadata)
end
