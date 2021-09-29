defmodule Envoy.Type.HashPolicy.SourceIp do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          policy_specifier: {atom, any}
        }
  defstruct [:policy_specifier]

  oneof(:policy_specifier, 0)
  field(:source_ip, 1, type: Envoy.Type.HashPolicy.SourceIp, oneof: 0)
end
