defmodule Envoy.Type.Matcher.V3.NodeMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node_id: Envoy.Type.Matcher.V3.StringMatcher.t() | nil,
          node_metadatas: [Envoy.Type.Matcher.V3.StructMatcher.t()]
        }
  defstruct [:node_id, :node_metadatas]

  field(:node_id, 1, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:node_metadatas, 2, repeated: true, type: Envoy.Type.Matcher.V3.StructMatcher)
end
