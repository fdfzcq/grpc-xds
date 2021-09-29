defmodule Envoy.Type.Matcher.V4alpha.RegexMatcher.GoogleRE2 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.Matcher.V4alpha.RegexMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          engine_type: {atom, any},
          regex: String.t()
        }
  defstruct [:engine_type, :regex]

  oneof(:engine_type, 0)
  field(:google_re2, 1, type: Envoy.Type.Matcher.V4alpha.RegexMatcher.GoogleRE2, oneof: 0)
  field(:regex, 2, type: :string)
end

defmodule Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pattern: Envoy.Type.Matcher.V4alpha.RegexMatcher.t() | nil,
          substitution: String.t()
        }
  defstruct [:pattern, :substitution]

  field(:pattern, 1, type: Envoy.Type.Matcher.V4alpha.RegexMatcher)
  field(:substitution, 2, type: :string)
end
