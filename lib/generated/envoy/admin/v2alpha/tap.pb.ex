defmodule Envoy.Admin.V2alpha.TapRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_id: String.t(),
          tap_config: Envoy.Service.Tap.V2alpha.TapConfig.t() | nil
        }
  defstruct [:config_id, :tap_config]

  field(:config_id, 1, type: :string)
  field(:tap_config, 2, type: Envoy.Service.Tap.V2alpha.TapConfig)
end
