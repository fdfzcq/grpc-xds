defmodule Envoy.Extensions.Compression.Gzip.Decompressor.V3.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          window_bits: Google.Protobuf.UInt32Value.t() | nil,
          chunk_size: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:window_bits, :chunk_size]

  field(:window_bits, 1, type: Google.Protobuf.UInt32Value)
  field(:chunk_size, 2, type: Google.Protobuf.UInt32Value)
end
