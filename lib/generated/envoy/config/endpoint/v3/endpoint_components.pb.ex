defmodule Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          port_value: non_neg_integer,
          hostname: String.t()
        }
  defstruct [:port_value, :hostname]

  field(:port_value, 1, type: :uint32)
  field(:hostname, 2, type: :string)
end

defmodule Envoy.Config.Endpoint.V3.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Config.Core.V3.Address.t() | nil,
          health_check_config: Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig.t() | nil,
          hostname: String.t()
        }
  defstruct [:address, :health_check_config, :hostname]

  field(:address, 1, type: Envoy.Config.Core.V3.Address)
  field(:health_check_config, 2, type: Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig)
  field(:hostname, 3, type: :string)
end

defmodule Envoy.Config.Endpoint.V3.LbEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_identifier: {atom, any},
          health_status: Envoy.Config.Core.V3.HealthStatus.t(),
          metadata: Envoy.Config.Core.V3.Metadata.t() | nil,
          load_balancing_weight: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:host_identifier, :health_status, :metadata, :load_balancing_weight]

  oneof(:host_identifier, 0)
  field(:endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint, oneof: 0)
  field(:endpoint_name, 5, type: :string, oneof: 0)
  field(:health_status, 2, type: Envoy.Config.Core.V3.HealthStatus, enum: true)
  field(:metadata, 3, type: Envoy.Config.Core.V3.Metadata)
  field(:load_balancing_weight, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Endpoint.V3.LocalityLbEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Config.Core.V3.Locality.t() | nil,
          lb_endpoints: [Envoy.Config.Endpoint.V3.LbEndpoint.t()],
          load_balancing_weight: Google.Protobuf.UInt32Value.t() | nil,
          priority: non_neg_integer,
          proximity: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:locality, :lb_endpoints, :load_balancing_weight, :priority, :proximity]

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:lb_endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.LbEndpoint)
  field(:load_balancing_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:priority, 5, type: :uint32)
  field(:proximity, 6, type: Google.Protobuf.UInt32Value)
end
