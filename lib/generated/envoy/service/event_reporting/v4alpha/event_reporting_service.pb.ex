defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V4alpha.Node.t() | nil
        }
  defstruct [:node]

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier:
            Envoy.Service.EventReporting.V4alpha.StreamEventsRequest.Identifier.t() | nil,
          events: [Google.Protobuf.Any.t()]
        }
  defstruct [:identifier, :events]

  field(:identifier, 1, type: Envoy.Service.EventReporting.V4alpha.StreamEventsRequest.Identifier)
  field(:events, 2, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Service.EventReporting.V4alpha.StreamEventsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
