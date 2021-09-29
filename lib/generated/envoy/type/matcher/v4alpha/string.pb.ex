defmodule Envoy.Type.Matcher.V4alpha.StringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match_pattern: {atom, any},
          ignore_case: boolean
        }
  defstruct [:match_pattern, :ignore_case]

  oneof(:match_pattern, 0)
  field(:exact, 1, type: :string, oneof: 0)
  field(:prefix, 2, type: :string, oneof: 0)
  field(:suffix, 3, type: :string, oneof: 0)
  field(:safe_regex, 5, type: Envoy.Type.Matcher.V4alpha.RegexMatcher, oneof: 0)
  field(:contains, 7, type: :string, oneof: 0)
  field(:ignore_case, 6, type: :bool)
end

defmodule Envoy.Type.Matcher.V4alpha.ListStringMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          patterns: [Envoy.Type.Matcher.V4alpha.StringMatcher.t()]
        }
  defstruct [:patterns]

  field(:patterns, 1, repeated: true, type: Envoy.Type.Matcher.V4alpha.StringMatcher)
end
