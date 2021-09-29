defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V3.Node.t() | nil
        }
  defstruct [:node]

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier.t() | nil,
          events: [Google.Protobuf.Any.t()]
        }
  defstruct [:identifier, :events]

  field(:identifier, 1, type: Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier)
  field(:events, 2, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
