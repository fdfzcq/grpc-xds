defmodule Envoy.Service.Tap.V4alpha.StreamTapsRequest.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V4alpha.Node.t() | nil,
          tap_id: String.t()
        }
  defstruct [:node, :tap_id]

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
  field(:tap_id, 2, type: :string)
end

defmodule Envoy.Service.Tap.V4alpha.StreamTapsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: Envoy.Service.Tap.V4alpha.StreamTapsRequest.Identifier.t() | nil,
          trace_id: non_neg_integer,
          trace: Envoy.Data.Tap.V3.TraceWrapper.t() | nil
        }
  defstruct [:identifier, :trace_id, :trace]

  field(:identifier, 1, type: Envoy.Service.Tap.V4alpha.StreamTapsRequest.Identifier)
  field(:trace_id, 2, type: :uint64)
  field(:trace, 3, type: Envoy.Data.Tap.V3.TraceWrapper)
end

defmodule Envoy.Service.Tap.V4alpha.StreamTapsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
