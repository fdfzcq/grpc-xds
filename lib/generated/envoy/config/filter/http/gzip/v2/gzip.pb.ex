defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :FILTERED | :HUFFMAN | :RLE

  field(:DEFAULT, 0)
  field(:FILTERED, 1)
  field(:HUFFMAN, 2)
  field(:RLE, 3)
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :BEST | :SPEED

  field(:DEFAULT, 0)
  field(:BEST, 1)
  field(:SPEED, 2)
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          memory_level: Google.Protobuf.UInt32Value.t() | nil,
          content_length: Google.Protobuf.UInt32Value.t() | nil,
          compression_level: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum.t(),
          compression_strategy: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy.t(),
          content_type: [String.t()],
          disable_on_etag_header: boolean,
          remove_accept_encoding_header: boolean,
          window_bits: Google.Protobuf.UInt32Value.t() | nil,
          compressor: Envoy.Config.Filter.Http.Compressor.V2.Compressor.t() | nil
        }
  defstruct [
    :memory_level,
    :content_length,
    :compression_level,
    :compression_strategy,
    :content_type,
    :disable_on_etag_header,
    :remove_accept_encoding_header,
    :window_bits,
    :compressor
  ]

  field(:memory_level, 1, type: Google.Protobuf.UInt32Value)
  field(:content_length, 2, type: Google.Protobuf.UInt32Value, deprecated: true)

  field(:compression_level, 3,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum,
    enum: true
  )

  field(:compression_strategy, 4,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy,
    enum: true
  )

  field(:content_type, 6, repeated: true, type: :string, deprecated: true)
  field(:disable_on_etag_header, 7, type: :bool, deprecated: true)
  field(:remove_accept_encoding_header, 8, type: :bool, deprecated: true)
  field(:window_bits, 9, type: Google.Protobuf.UInt32Value)
  field(:compressor, 10, type: Envoy.Config.Filter.Http.Compressor.V2.Compressor)
end
