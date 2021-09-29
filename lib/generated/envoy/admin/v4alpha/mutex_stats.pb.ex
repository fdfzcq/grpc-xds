defmodule Envoy.Admin.V4alpha.MutexStats do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num_contentions: non_neg_integer,
          current_wait_cycles: non_neg_integer,
          lifetime_wait_cycles: non_neg_integer
        }
  defstruct [:num_contentions, :current_wait_cycles, :lifetime_wait_cycles]

  field(:num_contentions, 1, type: :uint64)
  field(:current_wait_cycles, 2, type: :uint64)
  field(:lifetime_wait_cycles, 3, type: :uint64)
end
