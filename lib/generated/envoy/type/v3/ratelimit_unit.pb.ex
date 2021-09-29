defmodule Envoy.Type.V3.RateLimitUnit do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :SECOND | :MINUTE | :HOUR | :DAY

  field(:UNKNOWN, 0)
  field(:SECOND, 1)
  field(:MINUTE, 2)
  field(:HOUR, 3)
  field(:DAY, 4)
end
