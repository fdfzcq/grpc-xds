defmodule Envoy.Admin.V3.Memory do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allocated: non_neg_integer,
          heap_size: non_neg_integer,
          pageheap_unmapped: non_neg_integer,
          pageheap_free: non_neg_integer,
          total_thread_cache: non_neg_integer,
          total_physical_bytes: non_neg_integer
        }
  defstruct [
    :allocated,
    :heap_size,
    :pageheap_unmapped,
    :pageheap_free,
    :total_thread_cache,
    :total_physical_bytes
  ]

  field(:allocated, 1, type: :uint64)
  field(:heap_size, 2, type: :uint64)
  field(:pageheap_unmapped, 3, type: :uint64)
  field(:pageheap_free, 4, type: :uint64)
  field(:total_thread_cache, 5, type: :uint64)
  field(:total_physical_bytes, 6, type: :uint64)
end
