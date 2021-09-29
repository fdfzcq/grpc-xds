defmodule Envoy.Extensions.Retry.Host.OmitHostMetadata.V3.OmitHostMetadataConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata_match: Envoy.Config.Core.V3.Metadata.t() | nil
        }
  defstruct [:metadata_match]

  field(:metadata_match, 1, type: Envoy.Config.Core.V3.Metadata)
end
