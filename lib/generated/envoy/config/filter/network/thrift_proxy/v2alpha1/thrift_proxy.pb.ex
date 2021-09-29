defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO_TRANSPORT | :FRAMED | :UNFRAMED | :HEADER

  field(:AUTO_TRANSPORT, 0)
  field(:FRAMED, 1)
  field(:UNFRAMED, 2)
  field(:HEADER, 3)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO_PROTOCOL | :BINARY | :LAX_BINARY | :COMPACT | :TWITTER

  field(:AUTO_PROTOCOL, 0)
  field(:BINARY, 1)
  field(:LAX_BINARY, 2)
  field(:COMPACT, 3)
  field(:TWITTER, 4)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transport: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType.t(),
          protocol: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType.t(),
          stat_prefix: String.t(),
          route_config:
            Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteConfiguration.t() | nil,
          thrift_filters: [Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftFilter.t()]
        }
  defstruct [:transport, :protocol, :stat_prefix, :route_config, :thrift_filters]

  field(:transport, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType,
    enum: true
  )

  field(:protocol, 3,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType,
    enum: true
  )

  field(:stat_prefix, 1, type: :string)

  field(:route_config, 4,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.RouteConfiguration
  )

  field(:thrift_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftFilter
  )
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ThriftProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transport: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType.t(),
          protocol: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType.t()
        }
  defstruct [:transport, :protocol]

  field(:transport, 1,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.TransportType,
    enum: true
  )

  field(:protocol, 2,
    type: Envoy.Config.Filter.Network.ThriftProxy.V2alpha1.ProtocolType,
    enum: true
  )
end
