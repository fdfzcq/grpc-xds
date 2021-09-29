defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          probability: Envoy.Type.V3.FractionalPercent.t() | nil,
          kill_request_header: String.t()
        }
  defstruct [:probability, :kill_request_header]

  field(:probability, 1, type: Envoy.Type.V3.FractionalPercent)
  field(:kill_request_header, 2, type: :string)
end
