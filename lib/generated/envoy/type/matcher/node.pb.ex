defmodule Envoy.Type.Matcher.NodeMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_id: Envoy.Type.Matcher.StringMatcher.t() | nil,
          node_metadatas: [Envoy.Type.Matcher.StructMatcher.t()]
        }
  defstruct [:node_id, :node_metadatas]

  field(:node_id, 1, type: Envoy.Type.Matcher.StringMatcher)
  field(:node_metadatas, 2, repeated: true, type: Envoy.Type.Matcher.StructMatcher)
end
