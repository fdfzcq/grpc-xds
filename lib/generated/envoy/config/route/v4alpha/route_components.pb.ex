defmodule Envoy.Config.Route.V4alpha.VirtualHost.TlsRequirementType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NONE | :EXTERNAL_ONLY | :ALL

  field(:NONE, 0)
  field(:EXTERNAL_ONLY, 1)
  field(:ALL, 2)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.ClusterNotFoundResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SERVICE_UNAVAILABLE | :NOT_FOUND

  field(:SERVICE_UNAVAILABLE, 0)
  field(:NOT_FOUND, 1)
end

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeaderFormat do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SECONDS | :UNIX_TIMESTAMP

  field(:SECONDS, 0)
  field(:UNIX_TIMESTAMP, 1)
end

defmodule Envoy.Config.Route.V4alpha.RedirectAction.RedirectResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :MOVED_PERMANENTLY
          | :FOUND
          | :SEE_OTHER
          | :TEMPORARY_REDIRECT
          | :PERMANENT_REDIRECT

  field(:MOVED_PERMANENTLY, 0)
  field(:FOUND, 1)
  field(:SEE_OTHER, 2)
  field(:TEMPORARY_REDIRECT, 3)
  field(:PERMANENT_REDIRECT, 4)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.MetaData.Source do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DYNAMIC | :ROUTE_ENTRY

  field(:DYNAMIC, 0)
  field(:ROUTE_ENTRY, 1)
end

defmodule Envoy.Config.Route.V4alpha.VirtualHost.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Any.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Route.V4alpha.VirtualHost do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          domains: [String.t()],
          routes: [Envoy.Config.Route.V4alpha.Route.t()],
          require_tls: Envoy.Config.Route.V4alpha.VirtualHost.TlsRequirementType.t(),
          virtual_clusters: [Envoy.Config.Route.V4alpha.VirtualCluster.t()],
          rate_limits: [Envoy.Config.Route.V4alpha.RateLimit.t()],
          request_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          cors: Envoy.Config.Route.V4alpha.CorsPolicy.t() | nil,
          typed_per_filter_config: %{String.t() => Google.Protobuf.Any.t() | nil},
          include_request_attempt_count: boolean,
          include_attempt_count_in_response: boolean,
          retry_policy: Envoy.Config.Route.V4alpha.RetryPolicy.t() | nil,
          retry_policy_typed_config: Google.Protobuf.Any.t() | nil,
          hedge_policy: Envoy.Config.Route.V4alpha.HedgePolicy.t() | nil,
          per_request_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :name,
    :domains,
    :routes,
    :require_tls,
    :virtual_clusters,
    :rate_limits,
    :request_headers_to_add,
    :request_headers_to_remove,
    :response_headers_to_add,
    :response_headers_to_remove,
    :cors,
    :typed_per_filter_config,
    :include_request_attempt_count,
    :include_attempt_count_in_response,
    :retry_policy,
    :retry_policy_typed_config,
    :hedge_policy,
    :per_request_buffer_limit_bytes
  ]

  field(:name, 1, type: :string)
  field(:domains, 2, repeated: true, type: :string)
  field(:routes, 3, repeated: true, type: Envoy.Config.Route.V4alpha.Route)

  field(:require_tls, 4,
    type: Envoy.Config.Route.V4alpha.VirtualHost.TlsRequirementType,
    enum: true
  )

  field(:virtual_clusters, 5, repeated: true, type: Envoy.Config.Route.V4alpha.VirtualCluster)
  field(:rate_limits, 6, repeated: true, type: Envoy.Config.Route.V4alpha.RateLimit)

  field(:request_headers_to_add, 7,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:request_headers_to_remove, 13, repeated: true, type: :string)

  field(:response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:cors, 8, type: Envoy.Config.Route.V4alpha.CorsPolicy)

  field(:typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.VirtualHost.TypedPerFilterConfigEntry,
    map: true
  )

  field(:include_request_attempt_count, 14, type: :bool)
  field(:include_attempt_count_in_response, 19, type: :bool)
  field(:retry_policy, 16, type: Envoy.Config.Route.V4alpha.RetryPolicy)
  field(:retry_policy_typed_config, 20, type: Google.Protobuf.Any)
  field(:hedge_policy, 17, type: Envoy.Config.Route.V4alpha.HedgePolicy)
  field(:per_request_buffer_limit_bytes, 18, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Route.V4alpha.FilterAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: Google.Protobuf.Any.t() | nil
        }
  defstruct [:action]

  field(:action, 1, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Route.V4alpha.Route.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Any.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Route.V4alpha.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: {atom, any},
          name: String.t(),
          match: Envoy.Config.Route.V4alpha.RouteMatch.t() | nil,
          metadata: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          decorator: Envoy.Config.Route.V4alpha.Decorator.t() | nil,
          typed_per_filter_config: %{String.t() => Google.Protobuf.Any.t() | nil},
          request_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          tracing: Envoy.Config.Route.V4alpha.Tracing.t() | nil,
          per_request_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :action,
    :name,
    :match,
    :metadata,
    :decorator,
    :typed_per_filter_config,
    :request_headers_to_add,
    :request_headers_to_remove,
    :response_headers_to_add,
    :response_headers_to_remove,
    :tracing,
    :per_request_buffer_limit_bytes
  ]

  oneof(:action, 0)
  field(:name, 14, type: :string)
  field(:match, 1, type: Envoy.Config.Route.V4alpha.RouteMatch)
  field(:route, 2, type: Envoy.Config.Route.V4alpha.RouteAction, oneof: 0)
  field(:redirect, 3, type: Envoy.Config.Route.V4alpha.RedirectAction, oneof: 0)
  field(:direct_response, 7, type: Envoy.Config.Route.V4alpha.DirectResponseAction, oneof: 0)
  field(:filter_action, 17, type: Envoy.Config.Route.V4alpha.FilterAction, oneof: 0)
  field(:metadata, 4, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:decorator, 5, type: Envoy.Config.Route.V4alpha.Decorator)

  field(:typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.Route.TypedPerFilterConfigEntry,
    map: true
  )

  field(:request_headers_to_add, 9,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:request_headers_to_remove, 12, repeated: true, type: :string)

  field(:response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:tracing, 15, type: Envoy.Config.Route.V4alpha.Tracing)
  field(:per_request_buffer_limit_bytes, 16, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Config.Route.V4alpha.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Any.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Route.V4alpha.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          weight: Google.Protobuf.UInt32Value.t() | nil,
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          request_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Config.Core.V4alpha.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          typed_per_filter_config: %{String.t() => Google.Protobuf.Any.t() | nil}
        }
  defstruct [
    :name,
    :weight,
    :metadata_match,
    :request_headers_to_add,
    :request_headers_to_remove,
    :response_headers_to_add,
    :response_headers_to_remove,
    :typed_per_filter_config
  ]

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Config.Core.V4alpha.Metadata)

  field(:request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:request_headers_to_remove, 9, repeated: true, type: :string)

  field(:response_headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V4alpha.HeaderValueOption
  )

  field(:response_headers_to_remove, 6, repeated: true, type: :string)

  field(:typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    map: true
  )
end

defmodule Envoy.Config.Route.V4alpha.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [Envoy.Config.Route.V4alpha.WeightedCluster.ClusterWeight.t()],
          total_weight: Google.Protobuf.UInt32Value.t() | nil,
          runtime_key_prefix: String.t()
        }
  defstruct [:clusters, :total_weight, :runtime_key_prefix]

  field(:clusters, 1,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.WeightedCluster.ClusterWeight
  )

  field(:total_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:runtime_key_prefix, 2, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RouteMatch.GrpcRouteMatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Route.V4alpha.RouteMatch.TlsContextMatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          presented: Google.Protobuf.BoolValue.t() | nil,
          validated: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:presented, :validated]

  field(:presented, 1, type: Google.Protobuf.BoolValue)
  field(:validated, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Route.V4alpha.RouteMatch.ConnectMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Route.V4alpha.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_specifier: {atom, any},
          case_sensitive: Google.Protobuf.BoolValue.t() | nil,
          runtime_fraction: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent.t() | nil,
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()],
          query_parameters: [Envoy.Config.Route.V4alpha.QueryParameterMatcher.t()],
          grpc: Envoy.Config.Route.V4alpha.RouteMatch.GrpcRouteMatchOptions.t() | nil,
          tls_context: Envoy.Config.Route.V4alpha.RouteMatch.TlsContextMatchOptions.t() | nil
        }
  defstruct [
    :path_specifier,
    :case_sensitive,
    :runtime_fraction,
    :headers,
    :query_parameters,
    :grpc,
    :tls_context
  ]

  oneof(:path_specifier, 0)
  field(:prefix, 1, type: :string, oneof: 0)
  field(:path, 2, type: :string, oneof: 0)
  field(:safe_regex, 10, type: Envoy.Type.Matcher.V4alpha.RegexMatcher, oneof: 0)

  field(:connect_matcher, 12, type: Envoy.Config.Route.V4alpha.RouteMatch.ConnectMatcher, oneof: 0)

  field(:case_sensitive, 4, type: Google.Protobuf.BoolValue)
  field(:runtime_fraction, 9, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent)
  field(:headers, 6, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)

  field(:query_parameters, 7,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.QueryParameterMatcher
  )

  field(:grpc, 8, type: Envoy.Config.Route.V4alpha.RouteMatch.GrpcRouteMatchOptions)
  field(:tls_context, 11, type: Envoy.Config.Route.V4alpha.RouteMatch.TlsContextMatchOptions)
end

defmodule Envoy.Config.Route.V4alpha.CorsPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled_specifier: {atom, any},
          allow_origin_string_match: [Envoy.Type.Matcher.V4alpha.StringMatcher.t()],
          allow_methods: String.t(),
          allow_headers: String.t(),
          expose_headers: String.t(),
          max_age: String.t(),
          allow_credentials: Google.Protobuf.BoolValue.t() | nil,
          shadow_enabled: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent.t() | nil
        }
  defstruct [
    :enabled_specifier,
    :allow_origin_string_match,
    :allow_methods,
    :allow_headers,
    :expose_headers,
    :max_age,
    :allow_credentials,
    :shadow_enabled
  ]

  oneof(:enabled_specifier, 0)

  field(:allow_origin_string_match, 11,
    repeated: true,
    type: Envoy.Type.Matcher.V4alpha.StringMatcher
  )

  field(:allow_methods, 2, type: :string)
  field(:allow_headers, 3, type: :string)
  field(:expose_headers, 4, type: :string)
  field(:max_age, 5, type: :string)
  field(:allow_credentials, 6, type: Google.Protobuf.BoolValue)
  field(:filter_enabled, 9, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent, oneof: 0)
  field(:shadow_enabled, 10, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.RequestMirrorPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: String.t(),
          runtime_fraction: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent.t() | nil,
          trace_sampled: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:cluster, :runtime_fraction, :trace_sampled]

  field(:cluster, 1, type: :string)
  field(:runtime_fraction, 3, type: Envoy.Config.Core.V4alpha.RuntimeFractionalPercent)
  field(:trace_sampled, 4, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t(),
          regex_rewrite: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute.t() | nil
        }
  defstruct [:header_name, :regex_rewrite]

  field(:header_name, 1, type: :string)
  field(:regex_rewrite, 2, type: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.Cookie do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          ttl: Google.Protobuf.Duration.t() | nil,
          path: String.t()
        }
  defstruct [:name, :ttl, :path]

  field(:name, 1, type: :string)
  field(:ttl, 2, type: Google.Protobuf.Duration)
  field(:path, 3, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.ConnectionProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          source_ip: boolean
        }
  defstruct [:source_ip]

  field(:source_ip, 1, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.QueryParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field(:name, 1, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.FilterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t()
        }
  defstruct [:key]

  field(:key, 1, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          policy_specifier: {atom, any},
          terminal: boolean
        }
  defstruct [:policy_specifier, :terminal]

  oneof(:policy_specifier, 0)
  field(:header, 1, type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.Header, oneof: 0)
  field(:cookie, 2, type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.Cookie, oneof: 0)

  field(:connection_properties, 3,
    type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.ConnectionProperties,
    oneof: 0
  )

  field(:query_parameter, 5,
    type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.QueryParameter,
    oneof: 0
  )

  field(:filter_state, 6,
    type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.FilterState,
    oneof: 0
  )

  field(:terminal, 4, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig.ConnectConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          proxy_protocol_config: Envoy.Config.Core.V4alpha.ProxyProtocolConfig.t() | nil,
          allow_post: boolean
        }
  defstruct [:proxy_protocol_config, :allow_post]

  field(:proxy_protocol_config, 1, type: Envoy.Config.Core.V4alpha.ProxyProtocolConfig)
  field(:allow_post, 2, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upgrade_type: String.t(),
          enabled: Google.Protobuf.BoolValue.t() | nil,
          connect_config:
            Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig.ConnectConfig.t() | nil
        }
  defstruct [:upgrade_type, :enabled, :connect_config]

  field(:upgrade_type, 1, type: :string)
  field(:enabled, 2, type: Google.Protobuf.BoolValue)

  field(:connect_config, 3,
    type: Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig.ConnectConfig
  )
end

defmodule Envoy.Config.Route.V4alpha.RouteAction.MaxStreamDuration do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_stream_duration: Google.Protobuf.Duration.t() | nil,
          grpc_timeout_header_max: Google.Protobuf.Duration.t() | nil,
          grpc_timeout_header_offset: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:max_stream_duration, :grpc_timeout_header_max, :grpc_timeout_header_offset]

  field(:max_stream_duration, 1, type: Google.Protobuf.Duration)
  field(:grpc_timeout_header_max, 2, type: Google.Protobuf.Duration)
  field(:grpc_timeout_header_offset, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Route.V4alpha.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_specifier: {atom, any},
          host_rewrite_specifier: {atom, any},
          cluster_not_found_response_code:
            Envoy.Config.Route.V4alpha.RouteAction.ClusterNotFoundResponseCode.t(),
          metadata_match: Envoy.Config.Core.V4alpha.Metadata.t() | nil,
          prefix_rewrite: String.t(),
          regex_rewrite: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute.t() | nil,
          timeout: Google.Protobuf.Duration.t() | nil,
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          retry_policy: Envoy.Config.Route.V4alpha.RetryPolicy.t() | nil,
          retry_policy_typed_config: Google.Protobuf.Any.t() | nil,
          request_mirror_policies: [
            Envoy.Config.Route.V4alpha.RouteAction.RequestMirrorPolicy.t()
          ],
          priority: Envoy.Config.Core.V4alpha.RoutingPriority.t(),
          rate_limits: [Envoy.Config.Route.V4alpha.RateLimit.t()],
          hash_policy: [Envoy.Config.Route.V4alpha.RouteAction.HashPolicy.t()],
          cors: Envoy.Config.Route.V4alpha.CorsPolicy.t() | nil,
          upgrade_configs: [Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig.t()],
          internal_redirect_policy: Envoy.Config.Route.V4alpha.InternalRedirectPolicy.t() | nil,
          hedge_policy: Envoy.Config.Route.V4alpha.HedgePolicy.t() | nil,
          max_stream_duration: Envoy.Config.Route.V4alpha.RouteAction.MaxStreamDuration.t() | nil
        }
  defstruct [
    :cluster_specifier,
    :host_rewrite_specifier,
    :cluster_not_found_response_code,
    :metadata_match,
    :prefix_rewrite,
    :regex_rewrite,
    :timeout,
    :idle_timeout,
    :retry_policy,
    :retry_policy_typed_config,
    :request_mirror_policies,
    :priority,
    :rate_limits,
    :hash_policy,
    :cors,
    :upgrade_configs,
    :internal_redirect_policy,
    :hedge_policy,
    :max_stream_duration
  ]

  oneof(:cluster_specifier, 0)
  oneof(:host_rewrite_specifier, 1)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:cluster_header, 2, type: :string, oneof: 0)
  field(:weighted_clusters, 3, type: Envoy.Config.Route.V4alpha.WeightedCluster, oneof: 0)

  field(:cluster_not_found_response_code, 20,
    type: Envoy.Config.Route.V4alpha.RouteAction.ClusterNotFoundResponseCode,
    enum: true
  )

  field(:metadata_match, 4, type: Envoy.Config.Core.V4alpha.Metadata)
  field(:prefix_rewrite, 5, type: :string)
  field(:regex_rewrite, 32, type: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute)
  field(:host_rewrite_literal, 6, type: :string, oneof: 1)
  field(:auto_host_rewrite, 7, type: Google.Protobuf.BoolValue, oneof: 1)
  field(:host_rewrite_header, 29, type: :string, oneof: 1)

  field(:host_rewrite_path_regex, 35,
    type: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute,
    oneof: 1
  )

  field(:timeout, 8, type: Google.Protobuf.Duration)
  field(:idle_timeout, 24, type: Google.Protobuf.Duration)
  field(:retry_policy, 9, type: Envoy.Config.Route.V4alpha.RetryPolicy)
  field(:retry_policy_typed_config, 33, type: Google.Protobuf.Any)

  field(:request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.RouteAction.RequestMirrorPolicy
  )

  field(:priority, 11, type: Envoy.Config.Core.V4alpha.RoutingPriority, enum: true)
  field(:rate_limits, 13, repeated: true, type: Envoy.Config.Route.V4alpha.RateLimit)
  field(:hash_policy, 15, repeated: true, type: Envoy.Config.Route.V4alpha.RouteAction.HashPolicy)
  field(:cors, 17, type: Envoy.Config.Route.V4alpha.CorsPolicy)

  field(:upgrade_configs, 25,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.RouteAction.UpgradeConfig
  )

  field(:internal_redirect_policy, 34, type: Envoy.Config.Route.V4alpha.InternalRedirectPolicy)
  field(:hedge_policy, 27, type: Envoy.Config.Route.V4alpha.HedgePolicy)
  field(:max_stream_duration, 36, type: Envoy.Config.Route.V4alpha.RouteAction.MaxStreamDuration)
end

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.RetryPriority do
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

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.RetryHostPredicate do
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

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.RetryBackOff do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          base_interval: Google.Protobuf.Duration.t() | nil,
          max_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:base_interval, :max_interval]

  field(:base_interval, 1, type: Google.Protobuf.Duration)
  field(:max_interval, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          format: Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeaderFormat.t()
        }
  defstruct [:name, :format]

  field(:name, 1, type: :string)
  field(:format, 2, type: Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeaderFormat, enum: true)
end

defmodule Envoy.Config.Route.V4alpha.RetryPolicy.RateLimitedRetryBackOff do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reset_headers: [Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeader.t()],
          max_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:reset_headers, :max_interval]

  field(:reset_headers, 1,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.RetryPolicy.ResetHeader
  )

  field(:max_interval, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Route.V4alpha.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          retry_on: String.t(),
          max_retries: Google.Protobuf.UInt32Value.t() | nil,
          per_try_timeout: Google.Protobuf.Duration.t() | nil,
          retry_priority: Envoy.Config.Route.V4alpha.RetryPolicy.RetryPriority.t() | nil,
          retry_host_predicate: [Envoy.Config.Route.V4alpha.RetryPolicy.RetryHostPredicate.t()],
          host_selection_retry_max_attempts: integer,
          retriable_status_codes: [non_neg_integer],
          retry_back_off: Envoy.Config.Route.V4alpha.RetryPolicy.RetryBackOff.t() | nil,
          rate_limited_retry_back_off:
            Envoy.Config.Route.V4alpha.RetryPolicy.RateLimitedRetryBackOff.t() | nil,
          retriable_headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()],
          retriable_request_headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()]
        }
  defstruct [
    :retry_on,
    :max_retries,
    :per_try_timeout,
    :retry_priority,
    :retry_host_predicate,
    :host_selection_retry_max_attempts,
    :retriable_status_codes,
    :retry_back_off,
    :rate_limited_retry_back_off,
    :retriable_headers,
    :retriable_request_headers
  ]

  field(:retry_on, 1, type: :string)
  field(:max_retries, 2, type: Google.Protobuf.UInt32Value)
  field(:per_try_timeout, 3, type: Google.Protobuf.Duration)
  field(:retry_priority, 4, type: Envoy.Config.Route.V4alpha.RetryPolicy.RetryPriority)

  field(:retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.RetryPolicy.RetryHostPredicate
  )

  field(:host_selection_retry_max_attempts, 6, type: :int64)
  field(:retriable_status_codes, 7, repeated: true, type: :uint32)
  field(:retry_back_off, 8, type: Envoy.Config.Route.V4alpha.RetryPolicy.RetryBackOff)

  field(:rate_limited_retry_back_off, 11,
    type: Envoy.Config.Route.V4alpha.RetryPolicy.RateLimitedRetryBackOff
  )

  field(:retriable_headers, 9, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)

  field(:retriable_request_headers, 10,
    repeated: true,
    type: Envoy.Config.Route.V4alpha.HeaderMatcher
  )
end

defmodule Envoy.Config.Route.V4alpha.HedgePolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initial_requests: Google.Protobuf.UInt32Value.t() | nil,
          additional_request_chance: Envoy.Type.V3.FractionalPercent.t() | nil,
          hedge_on_per_try_timeout: boolean
        }
  defstruct [:initial_requests, :additional_request_chance, :hedge_on_per_try_timeout]

  field(:initial_requests, 1, type: Google.Protobuf.UInt32Value)
  field(:additional_request_chance, 2, type: Envoy.Type.V3.FractionalPercent)
  field(:hedge_on_per_try_timeout, 3, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.RedirectAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheme_rewrite_specifier: {atom, any},
          path_rewrite_specifier: {atom, any},
          host_redirect: String.t(),
          port_redirect: non_neg_integer,
          response_code: Envoy.Config.Route.V4alpha.RedirectAction.RedirectResponseCode.t(),
          strip_query: boolean
        }
  defstruct [
    :scheme_rewrite_specifier,
    :path_rewrite_specifier,
    :host_redirect,
    :port_redirect,
    :response_code,
    :strip_query
  ]

  oneof(:scheme_rewrite_specifier, 0)
  oneof(:path_rewrite_specifier, 1)
  field(:https_redirect, 4, type: :bool, oneof: 0)
  field(:scheme_redirect, 7, type: :string, oneof: 0)
  field(:host_redirect, 1, type: :string)
  field(:port_redirect, 8, type: :uint32)
  field(:path_redirect, 2, type: :string, oneof: 1)
  field(:prefix_rewrite, 5, type: :string, oneof: 1)
  field(:regex_rewrite, 9, type: Envoy.Type.Matcher.V4alpha.RegexMatchAndSubstitute, oneof: 1)

  field(:response_code, 3,
    type: Envoy.Config.Route.V4alpha.RedirectAction.RedirectResponseCode,
    enum: true
  )

  field(:strip_query, 6, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.DirectResponseAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: non_neg_integer,
          body: Envoy.Config.Core.V4alpha.DataSource.t() | nil
        }
  defstruct [:status, :body]

  field(:status, 1, type: :uint32)
  field(:body, 2, type: Envoy.Config.Core.V4alpha.DataSource)
end

defmodule Envoy.Config.Route.V4alpha.Decorator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          operation: String.t(),
          propagate: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:operation, :propagate]

  field(:operation, 1, type: :string)
  field(:propagate, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Config.Route.V4alpha.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          client_sampling: Envoy.Type.V3.FractionalPercent.t() | nil,
          random_sampling: Envoy.Type.V3.FractionalPercent.t() | nil,
          overall_sampling: Envoy.Type.V3.FractionalPercent.t() | nil,
          custom_tags: [Envoy.Type.Tracing.V3.CustomTag.t()]
        }
  defstruct [:client_sampling, :random_sampling, :overall_sampling, :custom_tags]

  field(:client_sampling, 1, type: Envoy.Type.V3.FractionalPercent)
  field(:random_sampling, 2, type: Envoy.Type.V3.FractionalPercent)
  field(:overall_sampling, 3, type: Envoy.Type.V3.FractionalPercent)
  field(:custom_tags, 4, repeated: true, type: Envoy.Type.Tracing.V3.CustomTag)
end

defmodule Envoy.Config.Route.V4alpha.VirtualCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()],
          name: String.t()
        }
  defstruct [:headers, :name]

  field(:headers, 4, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
  field(:name, 2, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.SourceCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.DestinationCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.RequestHeaders do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t(),
          descriptor_key: String.t(),
          skip_if_absent: boolean
        }
  defstruct [:header_name, :descriptor_key, :skip_if_absent]

  field(:header_name, 1, type: :string)
  field(:descriptor_key, 2, type: :string)
  field(:skip_if_absent, 3, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.RemoteAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.GenericKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_value: String.t(),
          descriptor_key: String.t()
        }
  defstruct [:descriptor_value, :descriptor_key]

  field(:descriptor_value, 1, type: :string)
  field(:descriptor_key, 2, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.HeaderValueMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_value: String.t(),
          expect_match: Google.Protobuf.BoolValue.t() | nil,
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()]
        }
  defstruct [:descriptor_value, :expect_match, :headers]

  field(:descriptor_value, 1, type: :string)
  field(:expect_match, 2, type: Google.Protobuf.BoolValue)
  field(:headers, 3, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.DynamicMetaData do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_key: String.t(),
          metadata_key: Envoy.Type.Metadata.V3.MetadataKey.t() | nil,
          default_value: String.t()
        }
  defstruct [:descriptor_key, :metadata_key, :default_value]

  field(:descriptor_key, 1, type: :string)
  field(:metadata_key, 2, type: Envoy.Type.Metadata.V3.MetadataKey)
  field(:default_value, 3, type: :string)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action.MetaData do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_key: String.t(),
          metadata_key: Envoy.Type.Metadata.V3.MetadataKey.t() | nil,
          default_value: String.t(),
          source: Envoy.Config.Route.V4alpha.RateLimit.Action.MetaData.Source.t()
        }
  defstruct [:descriptor_key, :metadata_key, :default_value, :source]

  field(:descriptor_key, 1, type: :string)
  field(:metadata_key, 2, type: Envoy.Type.Metadata.V3.MetadataKey)
  field(:default_value, 3, type: :string)
  field(:source, 4, type: Envoy.Config.Route.V4alpha.RateLimit.Action.MetaData.Source, enum: true)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Action do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action_specifier: {atom, any}
        }
  defstruct [:action_specifier]

  oneof(:action_specifier, 0)

  field(:source_cluster, 1,
    type: Envoy.Config.Route.V4alpha.RateLimit.Action.SourceCluster,
    oneof: 0
  )

  field(:destination_cluster, 2,
    type: Envoy.Config.Route.V4alpha.RateLimit.Action.DestinationCluster,
    oneof: 0
  )

  field(:request_headers, 3,
    type: Envoy.Config.Route.V4alpha.RateLimit.Action.RequestHeaders,
    oneof: 0
  )

  field(:remote_address, 4,
    type: Envoy.Config.Route.V4alpha.RateLimit.Action.RemoteAddress,
    oneof: 0
  )

  field(:generic_key, 5, type: Envoy.Config.Route.V4alpha.RateLimit.Action.GenericKey, oneof: 0)

  field(:header_value_match, 6,
    type: Envoy.Config.Route.V4alpha.RateLimit.Action.HeaderValueMatch,
    oneof: 0
  )

  field(:metadata, 8, type: Envoy.Config.Route.V4alpha.RateLimit.Action.MetaData, oneof: 0)
  field(:extension, 9, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Override.DynamicMetadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata_key: Envoy.Type.Metadata.V3.MetadataKey.t() | nil
        }
  defstruct [:metadata_key]

  field(:metadata_key, 1, type: Envoy.Type.Metadata.V3.MetadataKey)
end

defmodule Envoy.Config.Route.V4alpha.RateLimit.Override do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override_specifier: {atom, any}
        }
  defstruct [:override_specifier]

  oneof(:override_specifier, 0)

  field(:dynamic_metadata, 1,
    type: Envoy.Config.Route.V4alpha.RateLimit.Override.DynamicMetadata,
    oneof: 0
  )
end

defmodule Envoy.Config.Route.V4alpha.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stage: Google.Protobuf.UInt32Value.t() | nil,
          disable_key: String.t(),
          actions: [Envoy.Config.Route.V4alpha.RateLimit.Action.t()],
          limit: Envoy.Config.Route.V4alpha.RateLimit.Override.t() | nil
        }
  defstruct [:stage, :disable_key, :actions, :limit]

  field(:stage, 1, type: Google.Protobuf.UInt32Value)
  field(:disable_key, 2, type: :string)
  field(:actions, 3, repeated: true, type: Envoy.Config.Route.V4alpha.RateLimit.Action)
  field(:limit, 4, type: Envoy.Config.Route.V4alpha.RateLimit.Override)
end

defmodule Envoy.Config.Route.V4alpha.HeaderMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_match_specifier: {atom, any},
          name: String.t(),
          invert_match: boolean
        }
  defstruct [:header_match_specifier, :name, :invert_match]

  oneof(:header_match_specifier, 0)
  field(:name, 1, type: :string)
  field(:exact_match, 4, type: :string, oneof: 0)
  field(:safe_regex_match, 11, type: Envoy.Type.Matcher.V4alpha.RegexMatcher, oneof: 0)
  field(:range_match, 6, type: Envoy.Type.V3.Int64Range, oneof: 0)
  field(:present_match, 7, type: :bool, oneof: 0)
  field(:prefix_match, 9, type: :string, oneof: 0)
  field(:suffix_match, 10, type: :string, oneof: 0)
  field(:contains_match, 12, type: :string, oneof: 0)
  field(:invert_match, 8, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.QueryParameterMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          query_parameter_match_specifier: {atom, any},
          name: String.t()
        }
  defstruct [:query_parameter_match_specifier, :name]

  oneof(:query_parameter_match_specifier, 0)
  field(:name, 1, type: :string)
  field(:string_match, 5, type: Envoy.Type.Matcher.V4alpha.StringMatcher, oneof: 0)
  field(:present_match, 6, type: :bool, oneof: 0)
end

defmodule Envoy.Config.Route.V4alpha.InternalRedirectPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_internal_redirects: Google.Protobuf.UInt32Value.t() | nil,
          redirect_response_codes: [non_neg_integer],
          predicates: [Envoy.Config.Core.V4alpha.TypedExtensionConfig.t()],
          allow_cross_scheme_redirect: boolean
        }
  defstruct [
    :max_internal_redirects,
    :redirect_response_codes,
    :predicates,
    :allow_cross_scheme_redirect
  ]

  field(:max_internal_redirects, 1, type: Google.Protobuf.UInt32Value)
  field(:redirect_response_codes, 2, repeated: true, type: :uint32)
  field(:predicates, 3, repeated: true, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
  field(:allow_cross_scheme_redirect, 4, type: :bool)
end

defmodule Envoy.Config.Route.V4alpha.FilterConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config: Google.Protobuf.Any.t() | nil,
          is_optional: boolean
        }
  defstruct [:config, :is_optional]

  field(:config, 1, type: Google.Protobuf.Any)
  field(:is_optional, 2, type: :bool)
end
