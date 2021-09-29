defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Dubbo

  field(:Dubbo, 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :Hessian2

  field(:Hessian2, 0)
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          protocol_type: Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType.t(),
          serialization_type:
            Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType.t(),
          route_config: [Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration.t()],
          dubbo_filters: [Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter.t()]
        }
  defstruct [:stat_prefix, :protocol_type, :serialization_type, :route_config, :dubbo_filters]

  field(:stat_prefix, 1, type: :string)

  field(:protocol_type, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType,
    enum: true
  )

  field(:serialization_type, 3,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType,
    enum: true
  )

  field(:route_config, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration
  )

  field(:dubbo_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter
  )
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter do
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
