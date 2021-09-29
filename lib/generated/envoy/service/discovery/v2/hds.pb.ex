defmodule Envoy.Service.Discovery.V2.Capability.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :HTTP | :TCP | :REDIS

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:REDIS, 2)
end

defmodule Envoy.Service.Discovery.V2.Capability do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          health_check_protocols: [[Envoy.Service.Discovery.V2.Capability.Protocol.t()]]
        }
  defstruct [:health_check_protocols]

  field(:health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.Capability.Protocol,
    enum: true
  )
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Api.V2.Core.Node.t() | nil,
          capability: Envoy.Service.Discovery.V2.Capability.t() | nil
        }
  defstruct [:node, :capability]

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:capability, 2, type: Envoy.Service.Discovery.V2.Capability)
end

defmodule Envoy.Service.Discovery.V2.EndpointHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint: Envoy.Api.V2.Endpoint.Endpoint.t() | nil,
          health_status: Envoy.Api.V2.Core.HealthStatus.t()
        }
  defstruct [:endpoint, :health_status]

  field(:endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint)
  field(:health_status, 2, type: Envoy.Api.V2.Core.HealthStatus, enum: true)
end

defmodule Envoy.Service.Discovery.V2.EndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoints_health: [Envoy.Service.Discovery.V2.EndpointHealth.t()]
        }
  defstruct [:endpoints_health]

  field(:endpoints_health, 1, repeated: true, type: Envoy.Service.Discovery.V2.EndpointHealth)
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequestOrEndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_type: {atom, any}
        }
  defstruct [:request_type]

  oneof(:request_type, 0)
  field(:health_check_request, 1, type: Envoy.Service.Discovery.V2.HealthCheckRequest, oneof: 0)

  field(:endpoint_health_response, 2,
    type: Envoy.Service.Discovery.V2.EndpointHealthResponse,
    oneof: 0
  )
end

defmodule Envoy.Service.Discovery.V2.LocalityEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Api.V2.Core.Locality.t() | nil,
          endpoints: [Envoy.Api.V2.Endpoint.Endpoint.t()]
        }
  defstruct [:locality, :endpoints]

  field(:locality, 1, type: Envoy.Api.V2.Core.Locality)
  field(:endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.Endpoint)
end

defmodule Envoy.Service.Discovery.V2.ClusterHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          health_checks: [Envoy.Api.V2.Core.HealthCheck.t()],
          locality_endpoints: [Envoy.Service.Discovery.V2.LocalityEndpoints.t()]
        }
  defstruct [:cluster_name, :health_checks, :locality_endpoints]

  field(:cluster_name, 1, type: :string)
  field(:health_checks, 2, repeated: true, type: Envoy.Api.V2.Core.HealthCheck)

  field(:locality_endpoints, 3, repeated: true, type: Envoy.Service.Discovery.V2.LocalityEndpoints)
end

defmodule Envoy.Service.Discovery.V2.HealthCheckSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_health_checks: [Envoy.Service.Discovery.V2.ClusterHealthCheck.t()],
          interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:cluster_health_checks, :interval]

  field(:cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.ClusterHealthCheck
  )

  field(:interval, 2, type: Google.Protobuf.Duration)
end
