defmodule Envoy.Admin.V3.Listeners do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          listener_statuses: [Envoy.Admin.V3.ListenerStatus.t()]
        }
  defstruct [:listener_statuses]

  field(:listener_statuses, 1, repeated: true, type: Envoy.Admin.V3.ListenerStatus)
end

defmodule Envoy.Admin.V3.ListenerStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          local_address: Envoy.Config.Core.V3.Address.t() | nil
        }
  defstruct [:name, :local_address]

  field(:name, 1, type: :string)
  field(:local_address, 2, type: Envoy.Config.Core.V3.Address)
end
