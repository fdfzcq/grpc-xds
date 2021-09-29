defmodule Envoy.Data.Dns.V3.DnsTable.AddressList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: [String.t()]
        }
  defstruct [:address]

  field(:address, 1, repeated: true, type: :string)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          protocol_config: {atom, any}
        }
  defstruct [:protocol_config]

  oneof(:protocol_config, 0)
  field(:number, 1, type: :uint32, oneof: 0)
  field(:name, 2, type: :string, oneof: 0)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint_type: {atom, any},
          priority: non_neg_integer,
          weight: non_neg_integer,
          port: non_neg_integer
        }
  defstruct [:endpoint_type, :priority, :weight, :port]

  oneof(:endpoint_type, 0)
  field(:host_name, 1, type: :string, oneof: 0)
  field(:cluster_name, 2, type: :string, oneof: 0)
  field(:priority, 3, type: :uint32)
  field(:weight, 4, type: :uint32)
  field(:port, 5, type: :uint32)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service_name: String.t(),
          protocol: Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol.t() | nil,
          ttl: Google.Protobuf.Duration.t() | nil,
          targets: [Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget.t()]
        }
  defstruct [:service_name, :protocol, :ttl, :targets]

  field(:service_name, 1, type: :string)
  field(:protocol, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsServiceProtocol)
  field(:ttl, 3, type: Google.Protobuf.Duration)
  field(:targets, 4, repeated: true, type: Envoy.Data.Dns.V3.DnsTable.DnsServiceTarget)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsServiceList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          services: [Envoy.Data.Dns.V3.DnsTable.DnsService.t()]
        }
  defstruct [:services]

  field(:services, 1, repeated: true, type: Envoy.Data.Dns.V3.DnsTable.DnsService)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsEndpoint do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          endpoint_config: {atom, any}
        }
  defstruct [:endpoint_config]

  oneof(:endpoint_config, 0)
  field(:address_list, 1, type: Envoy.Data.Dns.V3.DnsTable.AddressList, oneof: 0)
  field(:cluster_name, 2, type: :string, oneof: 0)
  field(:service_list, 3, type: Envoy.Data.Dns.V3.DnsTable.DnsServiceList, oneof: 0)
end

defmodule Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          endpoint: Envoy.Data.Dns.V3.DnsTable.DnsEndpoint.t() | nil,
          answer_ttl: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:name, :endpoint, :answer_ttl]

  field(:name, 1, type: :string)
  field(:endpoint, 2, type: Envoy.Data.Dns.V3.DnsTable.DnsEndpoint)
  field(:answer_ttl, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Data.Dns.V3.DnsTable do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          external_retry_count: non_neg_integer,
          virtual_domains: [Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain.t()],
          known_suffixes: [Envoy.Type.Matcher.V3.StringMatcher.t()]
        }
  defstruct [:external_retry_count, :virtual_domains, :known_suffixes]

  field(:external_retry_count, 1, type: :uint32)
  field(:virtual_domains, 2, repeated: true, type: Envoy.Data.Dns.V3.DnsTable.DnsVirtualDomain)
  field(:known_suffixes, 3, repeated: true, type: Envoy.Type.Matcher.V3.StringMatcher)
end
