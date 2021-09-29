defmodule Envoy.Extensions.Compression.Brotli.Decompressor.V3.Brotli do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          disable_ring_buffer_reallocation: boolean,
          chunk_size: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:disable_ring_buffer_reallocation, :chunk_size]

  field(:disable_ring_buffer_reallocation, 1, type: :bool)
  field(:chunk_size, 2, type: Google.Protobuf.UInt32Value)
end
