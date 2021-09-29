defmodule Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig do
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

defmodule Envoy.Api.V2.Endpoint.Endpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Api.V2.Core.Address.t() | nil,
          health_check_config: Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig.t() | nil,
          hostname: String.t()
        }
  defstruct [:address, :health_check_config, :hostname]

  field(:address, 1, type: Envoy.Api.V2.Core.Address)
  field(:health_check_config, 2, type: Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig)
  field(:hostname, 3, type: :string)
end

defmodule Envoy.Api.V2.Endpoint.LbEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          host_identifier: {atom, any},
          health_status: Envoy.Api.V2.Core.HealthStatus.t(),
          metadata: Envoy.Api.V2.Core.Metadata.t() | nil,
          load_balancing_weight: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:host_identifier, :health_status, :metadata, :load_balancing_weight]

  oneof(:host_identifier, 0)
  field(:endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint, oneof: 0)
  field(:endpoint_name, 5, type: :string, oneof: 0)
  field(:health_status, 2, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
  field(:metadata, 3, type: Envoy.Api.V2.Core.Metadata)
  field(:load_balancing_weight, 4, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Endpoint.LocalityLbEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Api.V2.Core.Locality.t() | nil,
          lb_endpoints: [Envoy.Api.V2.Endpoint.LbEndpoint.t()],
          load_balancing_weight: Google.Protobuf.UInt32Value.t() | nil,
          priority: non_neg_integer,
          proximity: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:locality, :lb_endpoints, :load_balancing_weight, :priority, :proximity]

  field(:locality, 1, type: Envoy.Api.V2.Core.Locality)
  field(:lb_endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.LbEndpoint)
  field(:load_balancing_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:priority, 5, type: :uint32)
  field(:proximity, 6, type: Google.Protobuf.UInt32Value)
end
