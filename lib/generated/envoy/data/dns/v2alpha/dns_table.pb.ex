defmodule Envoy.Data.Dns.V2alpha.DnsTable.AddressList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: [String.t()]
        }
  defstruct [:address]

  field(:address, 1, repeated: true, type: :string)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint_config: {atom, any}
        }
  defstruct [:endpoint_config]

  oneof(:endpoint_config, 0)
  field(:address_list, 1, type: Envoy.Data.Dns.V2alpha.DnsTable.AddressList, oneof: 0)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          endpoint: Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint.t() | nil,
          answer_ttl: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:name, :endpoint, :answer_ttl]

  field(:name, 1, type: :string)
  field(:endpoint, 2, type: Envoy.Data.Dns.V2alpha.DnsTable.DnsEndpoint)
  field(:answer_ttl, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Data.Dns.V2alpha.DnsTable do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          external_retry_count: non_neg_integer,
          virtual_domains: [Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain.t()],
          known_suffixes: [Envoy.Type.Matcher.StringMatcher.t()]
        }
  defstruct [:external_retry_count, :virtual_domains, :known_suffixes]

  field(:external_retry_count, 1, type: :uint32)

  field(:virtual_domains, 2,
    repeated: true,
    type: Envoy.Data.Dns.V2alpha.DnsTable.DnsVirtualDomain
  )

  field(:known_suffixes, 3, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
end
