defmodule Envoy.Service.Health.V3.Capability.Protocol do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :HTTP | :TCP | :REDIS

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:REDIS, 2)
end

defmodule Envoy.Service.Health.V3.Capability do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          health_check_protocols: [[Envoy.Service.Health.V3.Capability.Protocol.t()]]
        }
  defstruct [:health_check_protocols]

  field(:health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.Capability.Protocol,
    enum: true
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V3.Node.t() | nil,
          capability: Envoy.Service.Health.V3.Capability.t() | nil
        }
  defstruct [:node, :capability]

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
  field(:capability, 2, type: Envoy.Service.Health.V3.Capability)
end

defmodule Envoy.Service.Health.V3.EndpointHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint: Envoy.Config.Endpoint.V3.Endpoint.t() | nil,
          health_status: Envoy.Config.Core.V3.HealthStatus.t()
        }
  defstruct [:endpoint, :health_status]

  field(:endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint)
  field(:health_status, 2, type: Envoy.Config.Core.V3.HealthStatus, enum: true)
end

defmodule Envoy.Service.Health.V3.LocalityEndpointsHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Config.Core.V3.Locality.t() | nil,
          endpoints_health: [Envoy.Service.Health.V3.EndpointHealth.t()]
        }
  defstruct [:locality, :endpoints_health]

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:endpoints_health, 2, repeated: true, type: Envoy.Service.Health.V3.EndpointHealth)
end

defmodule Envoy.Service.Health.V3.ClusterEndpointsHealth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          locality_endpoints_health: [Envoy.Service.Health.V3.LocalityEndpointsHealth.t()]
        }
  defstruct [:cluster_name, :locality_endpoints_health]

  field(:cluster_name, 1, type: :string)

  field(:locality_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpointsHealth
  )
end

defmodule Envoy.Service.Health.V3.EndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoints_health: [Envoy.Service.Health.V3.EndpointHealth.t()],
          cluster_endpoints_health: [Envoy.Service.Health.V3.ClusterEndpointsHealth.t()]
        }
  defstruct [:endpoints_health, :cluster_endpoints_health]

  field(:endpoints_health, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    deprecated: true
  )

  field(:cluster_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterEndpointsHealth
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_type: {atom, any}
        }
  defstruct [:request_type]

  oneof(:request_type, 0)
  field(:health_check_request, 1, type: Envoy.Service.Health.V3.HealthCheckRequest, oneof: 0)

  field(:endpoint_health_response, 2,
    type: Envoy.Service.Health.V3.EndpointHealthResponse,
    oneof: 0
  )
end

defmodule Envoy.Service.Health.V3.LocalityEndpoints do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          locality: Envoy.Config.Core.V3.Locality.t() | nil,
          endpoints: [Envoy.Config.Endpoint.V3.Endpoint.t()]
        }
  defstruct [:locality, :endpoints]

  field(:locality, 1, type: Envoy.Config.Core.V3.Locality)
  field(:endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.Endpoint)
end

defmodule Envoy.Service.Health.V3.ClusterHealthCheck do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          health_checks: [Envoy.Config.Core.V3.HealthCheck.t()],
          locality_endpoints: [Envoy.Service.Health.V3.LocalityEndpoints.t()],
          transport_socket_matches: [Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch.t()]
        }
  defstruct [:cluster_name, :health_checks, :locality_endpoints, :transport_socket_matches]

  field(:cluster_name, 1, type: :string)
  field(:health_checks, 2, repeated: true, type: Envoy.Config.Core.V3.HealthCheck)
  field(:locality_endpoints, 3, repeated: true, type: Envoy.Service.Health.V3.LocalityEndpoints)

  field(:transport_socket_matches, 4,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch
  )
end

defmodule Envoy.Service.Health.V3.HealthCheckSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_health_checks: [Envoy.Service.Health.V3.ClusterHealthCheck.t()],
          interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:cluster_health_checks, :interval]

  field(:cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterHealthCheck
  )

  field(:interval, 2, type: Google.Protobuf.Duration)
end
