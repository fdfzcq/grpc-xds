defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ServerContextConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source: {atom, any}
        }
  defstruct [:config_source]

  oneof(:config_source, 0)
  field(:inline_dns_table, 1, type: Envoy.Data.Dns.V4alpha.DnsTable, oneof: 0)
  field(:external_dns_table, 2, type: Envoy.Config.Core.V4alpha.DataSource, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ClientContextConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          resolver_timeout: Google.Protobuf.Duration.t() | nil,
          upstream_resolvers: [Envoy.Config.Core.V4alpha.Address.t()],
          max_pending_lookups: non_neg_integer
        }
  defstruct [:resolver_timeout, :upstream_resolvers, :max_pending_lookups]

  field(:resolver_timeout, 1, type: Google.Protobuf.Duration)
  field(:upstream_resolvers, 2, repeated: true, type: Envoy.Config.Core.V4alpha.Address)
  field(:max_pending_lookups, 3, type: :uint64)
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          server_config:
            Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ServerContextConfig.t()
            | nil,
          client_config:
            Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ClientContextConfig.t()
            | nil
        }
  defstruct [:stat_prefix, :server_config, :client_config]

  field(:stat_prefix, 1, type: :string)

  field(:server_config, 2,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ServerContextConfig
  )

  field(:client_config, 3,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V4alpha.DnsFilterConfig.ClientContextConfig
  )
end
