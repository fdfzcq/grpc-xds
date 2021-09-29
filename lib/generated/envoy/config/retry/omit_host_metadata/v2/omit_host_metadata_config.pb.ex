defmodule Envoy.Config.Retry.OmitHostMetadata.V2.OmitHostMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata_match: Envoy.Api.V2.Core.Metadata.t() | nil
        }
  defstruct [:metadata_match]

  field(:metadata_match, 1, type: Envoy.Api.V2.Core.Metadata)
end
