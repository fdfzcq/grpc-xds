defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Dubbo

  field(:Dubbo, 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Hessian2

  field(:Hessian2, 0)
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          protocol_type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType.t(),
          serialization_type:
            Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType.t(),
          route_config: [Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration.t()],
          dubbo_filters: [Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter.t()]
        }
  defstruct [:stat_prefix, :protocol_type, :serialization_type, :route_config, :dubbo_filters]

  field(:stat_prefix, 1, type: :string)

  field(:protocol_type, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.ProtocolType,
    enum: true
  )

  field(:serialization_type, 3,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.SerializationType,
    enum: true
  )

  field(:route_config, 4,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration
  )

  field(:dubbo_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter
  )
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.DubboFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :config]

  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Any)
end
