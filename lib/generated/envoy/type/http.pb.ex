defmodule Envoy.Type.CodecClientType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :HTTP1 | :HTTP2 | :HTTP3

  field(:HTTP1, 0)
  field(:HTTP2, 1)
  field(:HTTP3, 2)
end
