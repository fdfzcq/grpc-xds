defmodule Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any}
        }
  defstruct [:config_type]

  oneof(:config_type, 0)
  field(:admin_config, 1, type: Envoy.Config.Common.Tap.V2alpha.AdminConfig, oneof: 0)
  field(:static_config, 2, type: Envoy.Service.Tap.V2alpha.TapConfig, oneof: 0)
end

defmodule Envoy.Config.Common.Tap.V2alpha.AdminConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_id: String.t()
        }
  defstruct [:config_id]

  field(:config_id, 1, type: :string)
end
