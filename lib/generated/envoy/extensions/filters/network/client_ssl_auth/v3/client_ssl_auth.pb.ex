defmodule Envoy.Extensions.Filters.Network.ClientSslAuth.V3.ClientSSLAuth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          auth_api_cluster: String.t(),
          stat_prefix: String.t(),
          refresh_delay: Google.Protobuf.Duration.t() | nil,
          ip_white_list: [Envoy.Config.Core.V3.CidrRange.t()]
        }
  defstruct [:auth_api_cluster, :stat_prefix, :refresh_delay, :ip_white_list]

  field(:auth_api_cluster, 1, type: :string)
  field(:stat_prefix, 2, type: :string)
  field(:refresh_delay, 3, type: Google.Protobuf.Duration)
  field(:ip_white_list, 4, repeated: true, type: Envoy.Config.Core.V3.CidrRange)
end
