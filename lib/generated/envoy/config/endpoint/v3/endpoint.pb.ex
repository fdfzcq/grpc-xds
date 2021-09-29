defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          category: String.t(),
          drop_percentage: Envoy.Type.V3.FractionalPercent.t() | nil
        }
  defstruct [:category, :drop_percentage]

  field(:category, 1, type: :string)
  field(:drop_percentage, 2, type: Envoy.Type.V3.FractionalPercent)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          drop_overloads: [Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload.t()],
          overprovisioning_factor: Google.Protobuf.UInt32Value.t() | nil,
          endpoint_stale_after: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:drop_overloads, :overprovisioning_factor, :endpoint_stale_after]

  field(:drop_overloads, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload
  )

  field(:overprovisioning_factor, 3, type: Google.Protobuf.UInt32Value)
  field(:endpoint_stale_after, 4, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Endpoint.V3.Endpoint.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Endpoint.V3.Endpoint)
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_name: String.t(),
          endpoints: [Envoy.Config.Endpoint.V3.LocalityLbEndpoints.t()],
          named_endpoints: %{String.t() => Envoy.Config.Endpoint.V3.Endpoint.t() | nil},
          policy: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.t() | nil
        }
  defstruct [:cluster_name, :endpoints, :named_endpoints, :policy]

  field(:cluster_name, 1, type: :string)
  field(:endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.LocalityLbEndpoints)

  field(:named_endpoints, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry,
    map: true
  )

  field(:policy, 4, type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy)
end
