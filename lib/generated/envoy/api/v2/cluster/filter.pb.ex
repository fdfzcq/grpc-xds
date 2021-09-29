defmodule Envoy.Api.V2.Cluster.Filter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :typed_config]

  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Google.Protobuf.Any)
end
