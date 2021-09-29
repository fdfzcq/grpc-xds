defmodule Envoy.Config.GrpcCredential.V3.FileBasedMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          secret_data: Envoy.Config.Core.V3.DataSource.t() | nil,
          header_key: String.t(),
          header_prefix: String.t()
        }
  defstruct [:secret_data, :header_key, :header_prefix]

  field(:secret_data, 1, type: Envoy.Config.Core.V3.DataSource)
  field(:header_key, 2, type: :string)
  field(:header_prefix, 3, type: :string)
end
