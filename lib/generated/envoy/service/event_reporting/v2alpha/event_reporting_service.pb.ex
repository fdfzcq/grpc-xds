defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Api.V2.Core.Node.t() | nil
        }
  defstruct [:node]

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
end

defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier:
            Envoy.Service.EventReporting.V2alpha.StreamEventsRequest.Identifier.t() | nil,
          events: [Google.Protobuf.Any.t()]
        }
  defstruct [:identifier, :events]

  field(:identifier, 1, type: Envoy.Service.EventReporting.V2alpha.StreamEventsRequest.Identifier)
  field(:events, 2, repeated: true, type: Google.Protobuf.Any)
end

defmodule Envoy.Service.EventReporting.V2alpha.StreamEventsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
