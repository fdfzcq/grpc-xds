defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata_namespace: String.t(),
          key: String.t()
        }
  defstruct [:metadata_namespace, :key]

  field(:metadata_namespace, 1, type: :string)
  field(:key, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tlv_type: non_neg_integer,
          on_tlv_present:
            Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair.t()
            | nil
        }
  defstruct [:tlv_type, :on_tlv_present]

  field(:tlv_type, 1, type: :uint32)

  field(:on_tlv_present, 2,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair
  )
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule.t()]
        }
  defstruct [:rules]

  field(:rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule
  )
end
