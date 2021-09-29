defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.TransportType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO_TRANSPORT | :FRAMED | :UNFRAMED | :HEADER

  field(:AUTO_TRANSPORT, 0)
  field(:FRAMED, 1)
  field(:UNFRAMED, 2)
  field(:HEADER, 3)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ProtocolType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO_PROTOCOL | :BINARY | :LAX_BINARY | :COMPACT | :TWITTER

  field(:AUTO_PROTOCOL, 0)
  field(:BINARY, 1)
  field(:LAX_BINARY, 2)
  field(:COMPACT, 3)
  field(:TWITTER, 4)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ThriftProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transport: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.TransportType.t(),
          protocol: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ProtocolType.t(),
          stat_prefix: String.t(),
          route_config:
            Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteConfiguration.t() | nil,
          thrift_filters: [Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ThriftFilter.t()],
          payload_passthrough: boolean,
          max_requests_per_connection: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :transport,
    :protocol,
    :stat_prefix,
    :route_config,
    :thrift_filters,
    :payload_passthrough,
    :max_requests_per_connection
  ]

  field(:transport, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.TransportType,
    enum: true
  )

  field(:protocol, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ProtocolType,
    enum: true
  )

  field(:stat_prefix, 1, type: :string)

  field(:route_config, 4,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.RouteConfiguration
  )

  field(:thrift_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ThriftFilter
  )

  field(:payload_passthrough, 6, type: :bool)
  field(:max_requests_per_connection, 7, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ThriftFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ThriftProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transport: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.TransportType.t(),
          protocol: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ProtocolType.t()
        }
  defstruct [:transport, :protocol]

  field(:transport, 1,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.TransportType,
    enum: true
  )

  field(:protocol, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V4alpha.ProtocolType,
    enum: true
  )
end
