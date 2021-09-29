defmodule Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          weight: non_neg_integer,
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil
        }
  defstruct [:name, :weight, :metadata_match]

  field(:name, 1, type: :string)
  field(:weight, 2, type: :uint32)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [
            Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.WeightedCluster.ClusterWeight.t()
          ]
        }
  defstruct [:clusters]

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.WeightedCluster.ClusterWeight
  )
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.TunnelingConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          hostname: String.t(),
          use_post: boolean,
          headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()]
        }
  defstruct [:hostname, :use_post, :headers_to_add]

  field(:hostname, 1, type: :string)
  field(:use_post, 2, type: :bool)
  field(:headers_to_add, 3, repeated: true, type: Envoy.Config.Core.V4alpha.HeaderValueOption)
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_specifier: {atom, any},
          stat_prefix: String.t(),
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          downstream_idle_timeout: Google.Protobuf.Duration.t() | nil,
          upstream_idle_timeout: Google.Protobuf.Duration.t() | nil,
          access_log: [Envoy.Config.Accesslog.V4alpha.AccessLog.t()],
          max_connect_attempts: Google.Protobuf.UInt32Value.t() | nil,
          hash_policy: [Envoy.Type.V3.HashPolicy.t()],
          tunneling_config:
            Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.TunnelingConfig.t() | nil,
          max_downstream_connection_duration: Google.Protobuf.Duration.t() | nil
        }
  defstruct [
    :cluster_specifier,
    :stat_prefix,
    :metadata_match,
    :idle_timeout,
    :downstream_idle_timeout,
    :upstream_idle_timeout,
    :access_log,
    :max_connect_attempts,
    :hash_policy,
    :tunneling_config,
    :max_downstream_connection_duration
  ]

  oneof(:cluster_specifier, 0)
  field(:stat_prefix, 1, type: :string)
  field(:cluster, 2, type: :string, oneof: 0)

  field(:weighted_clusters, 10,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.WeightedCluster,
    oneof: 0
  )

  field(:metadata_match, 9, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:idle_timeout, 8, type: Google.Protobuf.Duration)
  field(:downstream_idle_timeout, 3, type: Google.Protobuf.Duration)
  field(:upstream_idle_timeout, 4, type: Google.Protobuf.Duration)
  field(:access_log, 5, repeated: true, type: Envoy.Config.Accesslog.V4alpha.AccessLog)
  field(:max_connect_attempts, 7, type: Google.Protobuf.UInt32Value)
  field(:hash_policy, 11, repeated: true, type: Envoy.Type.V3.HashPolicy)

  field(:tunneling_config, 12,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V4alpha.TcpProxy.TunnelingConfig
  )

  field(:max_downstream_connection_duration, 13, type: Google.Protobuf.Duration)
end
