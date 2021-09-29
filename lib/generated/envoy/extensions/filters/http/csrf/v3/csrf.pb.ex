defmodule Envoy.Extensions.Filters.Http.Csrf.V3.CsrfPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filter_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          shadow_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          additional_origins: [Envoy.Type.Matcher.V3.StringMatcher.t()]
        }
  defstruct [:filter_enabled, :shadow_enabled, :additional_origins]

  field(:filter_enabled, 1, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:shadow_enabled, 2, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:additional_origins, 3, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)
end
