defmodule Envoy.Type.Matcher.V3.RegexMatcher.GoogleRE2 do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_program_size: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [:max_program_size]

  field(:max_program_size, 1, type: Google.Protobuf.UInt32Value, deprecated: true)
end

defmodule Envoy.Type.Matcher.V3.RegexMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          engine_type: {atom, any},
          regex: String.t()
        }
  defstruct [:engine_type, :regex]

  oneof(:engine_type, 0)
  field(:google_re2, 1, type: Envoy.Type.Matcher.V3.RegexMatcher.GoogleRE2, oneof: 0)
  field(:regex, 2, type: :string)
end

defmodule Envoy.Type.Matcher.V3.RegexMatchAndSubstitute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pattern: Envoy.Type.Matcher.V3.RegexMatcher.t() | nil,
          substitution: String.t()
        }
  defstruct [:pattern, :substitution]

  field(:pattern, 1, type: Envoy.Type.Matcher.V3.RegexMatcher)
  field(:substitution, 2, type: :string)
end
