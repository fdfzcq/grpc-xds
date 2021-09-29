defmodule Envoy.Type.Matcher.V3.StructMatcher.PathSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          segment: {atom, any}
        }
  defstruct [:segment]

  oneof(:segment, 0)
  field(:key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Type.Matcher.V3.StructMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path: [Envoy.Type.Matcher.V3.StructMatcher.PathSegment.t()],
          value: Envoy.Type.Matcher.V3.ValueMatcher.t() | nil
        }
  defstruct [:path, :value]

  field(:path, 2, repeated: true, type: Envoy.Type.Matcher.V3.StructMatcher.PathSegment)
  field(:value, 3, type: Envoy.Type.Matcher.V3.ValueMatcher)
end
