defmodule Envoy.Extensions.Filters.Http.CdnLoop.V3alpha.CdnLoopConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cdn_id: String.t(),
          max_allowed_occurrences: non_neg_integer
        }
  defstruct [:cdn_id, :max_allowed_occurrences]

  field(:cdn_id, 1, type: :string)
  field(:max_allowed_occurrences, 2, type: :uint32)
end
