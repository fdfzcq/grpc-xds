defmodule Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RocketmqProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          route_config:
            Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteConfiguration.t() | nil,
          transient_object_life_span: Google.Protobuf.Duration.t() | nil,
          develop_mode: boolean
        }
  defstruct [:stat_prefix, :route_config, :transient_object_life_span, :develop_mode]

  field(:stat_prefix, 1, type: :string)

  field(:route_config, 2,
    type: Envoy.Extensions.Filters.Network.RocketmqProxy.V4alpha.RouteConfiguration
  )

  field(:transient_object_life_span, 3, type: Google.Protobuf.Duration)
  field(:develop_mode, 4, type: :bool)
end
