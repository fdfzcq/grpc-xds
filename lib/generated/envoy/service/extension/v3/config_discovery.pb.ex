defmodule Envoy.Service.Extension.V3.EcdsDummy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
