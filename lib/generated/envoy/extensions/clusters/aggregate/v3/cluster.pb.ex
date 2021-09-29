defmodule Envoy.Extensions.Clusters.Aggregate.V3.ClusterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [String.t()]
        }
  defstruct [:clusters]

  field(:clusters, 1, repeated: true, type: :string)
end
