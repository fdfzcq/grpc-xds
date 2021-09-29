defmodule Envoy.Config.GrpcCredential.V2alpha.AwsIamConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_name: String.t(),
          region: String.t()
        }
  defstruct [:service_name, :region]

  field(:service_name, 1, type: :string)
  field(:region, 2, type: :string)
end
