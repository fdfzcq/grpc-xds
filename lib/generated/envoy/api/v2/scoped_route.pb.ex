defmodule Envoy.Api.V2.ScopedRouteConfiguration.Key.Fragment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any}
        }
  defstruct [:type]

  oneof(:type, 0)
  field(:string_key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Api.V2.ScopedRouteConfiguration.Key do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fragments: [Envoy.Api.V2.ScopedRouteConfiguration.Key.Fragment.t()]
        }
  defstruct [:fragments]

  field(:fragments, 1, repeated: true, type: Envoy.Api.V2.ScopedRouteConfiguration.Key.Fragment)
end

defmodule Envoy.Api.V2.ScopedRouteConfiguration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          route_configuration_name: String.t(),
          key: Envoy.Api.V2.ScopedRouteConfiguration.Key.t() | nil
        }
  defstruct [:name, :route_configuration_name, :key]

  field(:name, 1, type: :string)
  field(:route_configuration_name, 2, type: :string)
  field(:key, 3, type: Envoy.Api.V2.ScopedRouteConfiguration.Key)
end
