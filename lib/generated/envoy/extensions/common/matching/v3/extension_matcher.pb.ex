defmodule Envoy.Extensions.Common.Matching.V3.ExtensionWithMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          matcher: Envoy.Config.Common.Matcher.V3.Matcher.t() | nil,
          extension_config: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil
        }
  defstruct [:matcher, :extension_config]

  field(:matcher, 1, type: Envoy.Config.Common.Matcher.V3.Matcher)
  field(:extension_config, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig)
end
