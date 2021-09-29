defmodule Envoy.Type.Matcher.V3.PathMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:path, 1, type: Envoy.Type.Matcher.V3.StringMatcher, oneof: 0)
end
