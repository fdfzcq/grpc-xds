defmodule Envoy.Config.Filter.Http.Tap.V2alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig.t() | nil
        }
  defstruct [:common_config]

  field(:common_config, 1, type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig)
end
