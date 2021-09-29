defmodule Envoy.Config.Filter.Network.Rbac.V2.RBAC.EnforcementType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ONE_TIME_ON_FIRST_BYTE | :CONTINUOUS

  field(:ONE_TIME_ON_FIRST_BYTE, 0)
  field(:CONTINUOUS, 1)
end

defmodule Envoy.Config.Filter.Network.Rbac.V2.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: Envoy.Config.Rbac.V2.RBAC.t() | nil,
          shadow_rules: Envoy.Config.Rbac.V2.RBAC.t() | nil,
          stat_prefix: String.t(),
          enforcement_type: Envoy.Config.Filter.Network.Rbac.V2.RBAC.EnforcementType.t()
        }
  defstruct [:rules, :shadow_rules, :stat_prefix, :enforcement_type]

  field(:rules, 1, type: Envoy.Config.Rbac.V2.RBAC)
  field(:shadow_rules, 2, type: Envoy.Config.Rbac.V2.RBAC)
  field(:stat_prefix, 3, type: :string)

  field(:enforcement_type, 4,
    type: Envoy.Config.Filter.Network.Rbac.V2.RBAC.EnforcementType,
    enum: true
  )
end
