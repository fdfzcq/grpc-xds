defmodule Envoy.Service.Trace.V3.StreamTracesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Service.Trace.V3.StreamTracesMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V3.Node.t() | nil
        }
  defstruct [:node]

  field(:node, 1, type: Envoy.Config.Core.V3.Node)
end

defmodule Envoy.Service.Trace.V3.StreamTracesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: Envoy.Service.Trace.V3.StreamTracesMessage.Identifier.t() | nil,
          spans: [Opencensus.Proto.Trace.V1.Span.t()]
        }
  defstruct [:identifier, :spans]

  field(:identifier, 1, type: Envoy.Service.Trace.V3.StreamTracesMessage.Identifier)
  field(:spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span)
end
