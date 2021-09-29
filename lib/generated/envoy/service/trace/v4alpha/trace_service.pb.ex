defmodule Envoy.Service.Trace.V4alpha.StreamTracesResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Service.Trace.V4alpha.StreamTracesMessage.Identifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V4alpha.Node.t() | nil
        }
  defstruct [:node]

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
end

defmodule Envoy.Service.Trace.V4alpha.StreamTracesMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: Envoy.Service.Trace.V4alpha.StreamTracesMessage.Identifier.t() | nil,
          spans: [Opencensus.Proto.Trace.V1.Span.t()]
        }
  defstruct [:identifier, :spans]

  field(:identifier, 1, type: Envoy.Service.Trace.V4alpha.StreamTracesMessage.Identifier)
  field(:spans, 2, repeated: true, type: Opencensus.Proto.Trace.V1.Span)
end
