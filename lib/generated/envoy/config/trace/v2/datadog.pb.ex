defmodule Envoy.Config.Trace.V2.DatadogConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          collector_cluster: String.t(),
          service_name: String.t()
        }
  defstruct [:collector_cluster, :service_name]

  field(:collector_cluster, 1, type: :string)
  field(:service_name, 2, type: :string)
end
