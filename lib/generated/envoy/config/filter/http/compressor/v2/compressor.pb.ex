defmodule Envoy.Config.Filter.Http.Compressor.V2.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content_length: Google.Protobuf.UInt32Value.t() | nil,
          content_type: [String.t()],
          disable_on_etag_header: boolean,
          remove_accept_encoding_header: boolean,
          runtime_enabled: Envoy.Api.V2.Core.RuntimeFeatureFlag.t() | nil
        }
  defstruct [
    :content_length,
    :content_type,
    :disable_on_etag_header,
    :remove_accept_encoding_header,
    :runtime_enabled
  ]

  field(:content_length, 1, type: Google.Protobuf.UInt32Value)
  field(:content_type, 2, repeated: true, type: :string)
  field(:disable_on_etag_header, 3, type: :bool)
  field(:remove_accept_encoding_header, 4, type: :bool)
  field(:runtime_enabled, 5, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
end
