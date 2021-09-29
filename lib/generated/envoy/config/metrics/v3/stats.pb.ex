defmodule Envoy.Config.Metrics.V3.StatsSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.StatsConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stats_tags: [Envoy.Config.Metrics.V3.TagSpecifier.t()],
          use_all_default_tags: Google.Protobuf.BoolValue.t() | nil,
          stats_matcher: Envoy.Config.Metrics.V3.StatsMatcher.t() | nil,
          histogram_bucket_settings: [Envoy.Config.Metrics.V3.HistogramBucketSettings.t()]
        }
  defstruct [:stats_tags, :use_all_default_tags, :stats_matcher, :histogram_bucket_settings]

  field(:stats_tags, 1, repeated: true, type: Envoy.Config.Metrics.V3.TagSpecifier)
  field(:use_all_default_tags, 2, type: Google.Protobuf.BoolValue)
  field(:stats_matcher, 3, type: Envoy.Config.Metrics.V3.StatsMatcher)

  field(:histogram_bucket_settings, 4,
    repeated: true,
    type: Envoy.Config.Metrics.V3.HistogramBucketSettings
  )
end

defmodule Envoy.Config.Metrics.V3.StatsMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stats_matcher: {atom, any}
        }
  defstruct [:stats_matcher]

  oneof(:stats_matcher, 0)
  field(:reject_all, 1, type: :bool, oneof: 0)
  field(:exclusion_list, 2, type: Envoy.Type.Matcher.V3.ListStringMatcher, oneof: 0)
  field(:inclusion_list, 3, type: Envoy.Type.Matcher.V3.ListStringMatcher, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.TagSpecifier do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tag_value: {atom, any},
          tag_name: String.t()
        }
  defstruct [:tag_value, :tag_name]

  oneof(:tag_value, 0)
  field(:tag_name, 1, type: :string)
  field(:regex, 2, type: :string, oneof: 0)
  field(:fixed_value, 3, type: :string, oneof: 0)
end

defmodule Envoy.Config.Metrics.V3.HistogramBucketSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match: Envoy.Type.Matcher.V3.StringMatcher.t() | nil,
          buckets: [float | :infinity | :negative_infinity | :nan]
        }
  defstruct [:match, :buckets]

  field(:match, 1, type: Envoy.Type.Matcher.V3.StringMatcher)
  field(:buckets, 2, repeated: true, type: :double)
end

defmodule Envoy.Config.Metrics.V3.StatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          statsd_specifier: {atom, any},
          prefix: String.t()
        }
  defstruct [:statsd_specifier, :prefix]

  oneof(:statsd_specifier, 0)
  field(:address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0)
  field(:tcp_cluster_name, 2, type: :string, oneof: 0)
  field(:prefix, 3, type: :string)
end

defmodule Envoy.Config.Metrics.V3.DogStatsdSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          dog_statsd_specifier: {atom, any},
          prefix: String.t(),
          max_bytes_per_datagram: Google.Protobuf.UInt64Value.t() | nil
        }
  defstruct [:dog_statsd_specifier, :prefix, :max_bytes_per_datagram]

  oneof(:dog_statsd_specifier, 0)
  field(:address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0)
  field(:prefix, 3, type: :string)
  field(:max_bytes_per_datagram, 4, type: Google.Protobuf.UInt64Value)
end

defmodule Envoy.Config.Metrics.V3.HystrixSink do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          num_buckets: integer
        }
  defstruct [:num_buckets]

  field(:num_buckets, 1, type: :int64)
end
