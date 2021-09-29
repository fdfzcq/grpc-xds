defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any}
        }
  defstruct [:type]

  oneof(:type, 0)
  field(:string_key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration.Key do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fragments: [Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment.t()]
        }
  defstruct [:fragments]

  field(:fragments, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.Fragment
  )
end

defmodule Envoy.Config.Route.V3.ScopedRouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          on_demand: boolean,
          name: String.t(),
          route_configuration_name: String.t(),
          key: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key.t() | nil
        }
  defstruct [:on_demand, :name, :route_configuration_name, :key]

  field(:on_demand, 4, type: :bool)
  field(:name, 1, type: :string)
  field(:route_configuration_name, 2, type: :string)
  field(:key, 3, type: Envoy.Config.Route.V3.ScopedRouteConfiguration.Key)
end
