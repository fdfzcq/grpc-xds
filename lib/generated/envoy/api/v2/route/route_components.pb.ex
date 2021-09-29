defmodule Envoy.Api.V2.Route.VirtualHost.TlsRequirementType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NONE | :EXTERNAL_ONLY | :ALL

  field(:NONE, 0)
  field(:EXTERNAL_ONLY, 1)
  field(:ALL, 2)
end

defmodule Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :SERVICE_UNAVAILABLE | :NOT_FOUND

  field(:SERVICE_UNAVAILABLE, 0)
  field(:NOT_FOUND, 1)
end

defmodule Envoy.Api.V2.Route.RouteAction.InternalRedirectAction do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :PASS_THROUGH_INTERNAL_REDIRECT | :HANDLE_INTERNAL_REDIRECT

  field(:PASS_THROUGH_INTERNAL_REDIRECT, 0)
  field(:HANDLE_INTERNAL_REDIRECT, 1)
end

defmodule Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode do
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

defmodule Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry do
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

defmodule Envoy.Api.V2.Route.VirtualHost do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          domains: [String.t()],
          routes: [Envoy.Api.V2.Route.Route.t()],
          require_tls: Envoy.Api.V2.Route.VirtualHost.TlsRequirementType.t(),
          virtual_clusters: [Envoy.Api.V2.Route.VirtualCluster.t()],
          rate_limits: [Envoy.Api.V2.Route.RateLimit.t()],
          request_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          cors: Envoy.Api.V2.Route.CorsPolicy.t() | nil,
          per_filter_config: %{String.t() => Google.Protobuf.Struct.t() | nil},
          typed_per_filter_config: %{String.t() => Google.Protobuf.Any.t() | nil},
          include_request_attempt_count: boolean,
          include_attempt_count_in_response: boolean,
          retry_policy: Envoy.Api.V2.Route.RetryPolicy.t() | nil,
          retry_policy_typed_config: Google.Protobuf.Any.t() | nil,
          hedge_policy: Envoy.Api.V2.Route.HedgePolicy.t() | nil,
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
    :per_filter_config,
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
  field(:routes, 3, repeated: true, type: Envoy.Api.V2.Route.Route)
  field(:require_tls, 4, type: Envoy.Api.V2.Route.VirtualHost.TlsRequirementType, enum: true)
  field(:virtual_clusters, 5, repeated: true, type: Envoy.Api.V2.Route.VirtualCluster)
  field(:rate_limits, 6, repeated: true, type: Envoy.Api.V2.Route.RateLimit)
  field(:request_headers_to_add, 7, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 13, repeated: true, type: :string)
  field(:response_headers_to_add, 10, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:cors, 8, type: Envoy.Api.V2.Route.CorsPolicy)

  field(:per_filter_config, 12,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry,
    map: true
  )

  field(:include_request_attempt_count, 14, type: :bool)
  field(:include_attempt_count_in_response, 19, type: :bool)
  field(:retry_policy, 16, type: Envoy.Api.V2.Route.RetryPolicy)
  field(:retry_policy_typed_config, 20, type: Google.Protobuf.Any)
  field(:hedge_policy, 17, type: Envoy.Api.V2.Route.HedgePolicy)
  field(:per_request_buffer_limit_bytes, 18, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Route.FilterAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: Google.Protobuf.Any.t() | nil
        }
  defstruct [:action]

  field(:action, 1, type: Google.Protobuf.Any)
end

defmodule Envoy.Api.V2.Route.Route.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry do
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

defmodule Envoy.Api.V2.Route.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: {atom, any},
          name: String.t(),
          match: Envoy.Api.V2.Route.RouteMatch.t() | nil,
          metadata: Envoy.Api.V2.Core.Metadata.t() | nil,
          decorator: Envoy.Api.V2.Route.Decorator.t() | nil,
          per_filter_config: %{String.t() => Google.Protobuf.Struct.t() | nil},
          typed_per_filter_config: %{String.t() => Google.Protobuf.Any.t() | nil},
          request_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          tracing: Envoy.Api.V2.Route.Tracing.t() | nil,
          per_request_buffer_limit_bytes: Google.Protobuf.UInt32Value.t() | nil
        }
  defstruct [
    :action,
    :name,
    :match,
    :metadata,
    :decorator,
    :per_filter_config,
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
  field(:match, 1, type: Envoy.Api.V2.Route.RouteMatch)
  field(:route, 2, type: Envoy.Api.V2.Route.RouteAction, oneof: 0)
  field(:redirect, 3, type: Envoy.Api.V2.Route.RedirectAction, oneof: 0)
  field(:direct_response, 7, type: Envoy.Api.V2.Route.DirectResponseAction, oneof: 0)
  field(:filter_action, 17, type: Envoy.Api.V2.Route.FilterAction, oneof: 0)
  field(:metadata, 4, type: Envoy.Api.V2.Core.Metadata)
  field(:decorator, 5, type: Envoy.Api.V2.Route.Decorator)

  field(:per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry,
    map: true
  )

  field(:request_headers_to_add, 9, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 12, repeated: true, type: :string)
  field(:response_headers_to_add, 10, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 11, repeated: true, type: :string)
  field(:tracing, 15, type: Envoy.Api.V2.Route.Tracing)
  field(:per_request_buffer_limit_bytes, 16, type: Google.Protobuf.UInt32Value)
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
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

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          weight: Google.Protobuf.UInt32Value.t() | nil,
          metadata_match: Envoy.Api.V2.Core.Metadata.t() | nil,
          request_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          request_headers_to_remove: [String.t()],
          response_headers_to_add: [Envoy.Api.V2.Core.HeaderValueOption.t()],
          response_headers_to_remove: [String.t()],
          per_filter_config: %{String.t() => Google.Protobuf.Struct.t() | nil},
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
    :per_filter_config,
    :typed_per_filter_config
  ]

  field(:name, 1, type: :string)
  field(:weight, 2, type: Google.Protobuf.UInt32Value)
  field(:metadata_match, 3, type: Envoy.Api.V2.Core.Metadata)
  field(:request_headers_to_add, 4, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:request_headers_to_remove, 9, repeated: true, type: :string)
  field(:response_headers_to_add, 5, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption)
  field(:response_headers_to_remove, 6, repeated: true, type: :string)

  field(:per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry,
    deprecated: true,
    map: true
  )

  field(:typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    map: true
  )
end

defmodule Envoy.Api.V2.Route.WeightedCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          clusters: [Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.t()],
          total_weight: Google.Protobuf.UInt32Value.t() | nil,
          runtime_key_prefix: String.t()
        }
  defstruct [:clusters, :total_weight, :runtime_key_prefix]

  field(:clusters, 1, repeated: true, type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight)
  field(:total_weight, 3, type: Google.Protobuf.UInt32Value)
  field(:runtime_key_prefix, 2, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions do
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

defmodule Envoy.Api.V2.Route.RouteMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path_specifier: {atom, any},
          case_sensitive: Google.Protobuf.BoolValue.t() | nil,
          runtime_fraction: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil,
          headers: [Envoy.Api.V2.Route.HeaderMatcher.t()],
          query_parameters: [Envoy.Api.V2.Route.QueryParameterMatcher.t()],
          grpc: Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions.t() | nil,
          tls_context: Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions.t() | nil
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
  field(:regex, 3, type: :string, deprecated: true, oneof: 0)
  field(:safe_regex, 10, type: Envoy.Type.Matcher.RegexMatcher, oneof: 0)
  field(:case_sensitive, 4, type: Google.Protobuf.BoolValue)
  field(:runtime_fraction, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:headers, 6, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:query_parameters, 7, repeated: true, type: Envoy.Api.V2.Route.QueryParameterMatcher)
  field(:grpc, 8, type: Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions)
  field(:tls_context, 11, type: Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions)
end

defmodule Envoy.Api.V2.Route.CorsPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled_specifier: {atom, any},
          allow_origin: [String.t()],
          allow_origin_regex: [String.t()],
          allow_origin_string_match: [Envoy.Type.Matcher.StringMatcher.t()],
          allow_methods: String.t(),
          allow_headers: String.t(),
          expose_headers: String.t(),
          max_age: String.t(),
          allow_credentials: Google.Protobuf.BoolValue.t() | nil,
          shadow_enabled: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil
        }
  defstruct [
    :enabled_specifier,
    :allow_origin,
    :allow_origin_regex,
    :allow_origin_string_match,
    :allow_methods,
    :allow_headers,
    :expose_headers,
    :max_age,
    :allow_credentials,
    :shadow_enabled
  ]

  oneof(:enabled_specifier, 0)
  field(:allow_origin, 1, repeated: true, type: :string, deprecated: true)
  field(:allow_origin_regex, 8, repeated: true, type: :string, deprecated: true)
  field(:allow_origin_string_match, 11, repeated: true, type: Envoy.Type.Matcher.StringMatcher)
  field(:allow_methods, 2, type: :string)
  field(:allow_headers, 3, type: :string)
  field(:expose_headers, 4, type: :string)
  field(:max_age, 5, type: :string)
  field(:allow_credentials, 6, type: Google.Protobuf.BoolValue)
  field(:enabled, 7, type: Google.Protobuf.BoolValue, deprecated: true, oneof: 0)
  field(:filter_enabled, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent, oneof: 0)
  field(:shadow_enabled, 10, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
end

defmodule Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster: String.t(),
          runtime_key: String.t(),
          runtime_fraction: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil,
          trace_sampled: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:cluster, :runtime_key, :runtime_fraction, :trace_sampled]

  field(:cluster, 1, type: :string)
  field(:runtime_key, 2, type: :string, deprecated: true)
  field(:runtime_fraction, 3, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:trace_sampled, 4, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t()
        }
  defstruct [:header_name]

  field(:header_name, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie do
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

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          source_ip: boolean
        }
  defstruct [:source_ip]

  field(:source_ip, 1, type: :bool)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field(:name, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t()
        }
  defstruct [:key]

  field(:key, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          policy_specifier: {atom, any},
          terminal: boolean
        }
  defstruct [:policy_specifier, :terminal]

  oneof(:policy_specifier, 0)
  field(:header, 1, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Header, oneof: 0)
  field(:cookie, 2, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie, oneof: 0)

  field(:connection_properties, 3,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties,
    oneof: 0
  )

  field(:query_parameter, 5,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter,
    oneof: 0
  )

  field(:filter_state, 6, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState, oneof: 0)
  field(:terminal, 4, type: :bool)
end

defmodule Envoy.Api.V2.Route.RouteAction.UpgradeConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upgrade_type: String.t(),
          enabled: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:upgrade_type, :enabled]

  field(:upgrade_type, 1, type: :string)
  field(:enabled, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Api.V2.Route.RouteAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          cluster_specifier: {atom, any},
          host_rewrite_specifier: {atom, any},
          cluster_not_found_response_code:
            Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode.t(),
          metadata_match: Envoy.Api.V2.Core.Metadata.t() | nil,
          prefix_rewrite: String.t(),
          regex_rewrite: Envoy.Type.Matcher.RegexMatchAndSubstitute.t() | nil,
          timeout: Google.Protobuf.Duration.t() | nil,
          idle_timeout: Google.Protobuf.Duration.t() | nil,
          retry_policy: Envoy.Api.V2.Route.RetryPolicy.t() | nil,
          retry_policy_typed_config: Google.Protobuf.Any.t() | nil,
          request_mirror_policy: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy.t() | nil,
          request_mirror_policies: [Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy.t()],
          priority: Envoy.Api.V2.Core.RoutingPriority.t(),
          rate_limits: [Envoy.Api.V2.Route.RateLimit.t()],
          include_vh_rate_limits: Google.Protobuf.BoolValue.t() | nil,
          hash_policy: [Envoy.Api.V2.Route.RouteAction.HashPolicy.t()],
          cors: Envoy.Api.V2.Route.CorsPolicy.t() | nil,
          max_grpc_timeout: Google.Protobuf.Duration.t() | nil,
          grpc_timeout_offset: Google.Protobuf.Duration.t() | nil,
          upgrade_configs: [Envoy.Api.V2.Route.RouteAction.UpgradeConfig.t()],
          internal_redirect_action: Envoy.Api.V2.Route.RouteAction.InternalRedirectAction.t(),
          max_internal_redirects: Google.Protobuf.UInt32Value.t() | nil,
          hedge_policy: Envoy.Api.V2.Route.HedgePolicy.t() | nil
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
    :request_mirror_policy,
    :request_mirror_policies,
    :priority,
    :rate_limits,
    :include_vh_rate_limits,
    :hash_policy,
    :cors,
    :max_grpc_timeout,
    :grpc_timeout_offset,
    :upgrade_configs,
    :internal_redirect_action,
    :max_internal_redirects,
    :hedge_policy
  ]

  oneof(:cluster_specifier, 0)
  oneof(:host_rewrite_specifier, 1)
  field(:cluster, 1, type: :string, oneof: 0)
  field(:cluster_header, 2, type: :string, oneof: 0)
  field(:weighted_clusters, 3, type: Envoy.Api.V2.Route.WeightedCluster, oneof: 0)

  field(:cluster_not_found_response_code, 20,
    type: Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode,
    enum: true
  )

  field(:metadata_match, 4, type: Envoy.Api.V2.Core.Metadata)
  field(:prefix_rewrite, 5, type: :string)
  field(:regex_rewrite, 32, type: Envoy.Type.Matcher.RegexMatchAndSubstitute)
  field(:host_rewrite, 6, type: :string, oneof: 1)
  field(:auto_host_rewrite, 7, type: Google.Protobuf.BoolValue, oneof: 1)
  field(:auto_host_rewrite_header, 29, type: :string, oneof: 1)
  field(:timeout, 8, type: Google.Protobuf.Duration)
  field(:idle_timeout, 24, type: Google.Protobuf.Duration)
  field(:retry_policy, 9, type: Envoy.Api.V2.Route.RetryPolicy)
  field(:retry_policy_typed_config, 33, type: Google.Protobuf.Any)

  field(:request_mirror_policy, 10,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy,
    deprecated: true
  )

  field(:request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy
  )

  field(:priority, 11, type: Envoy.Api.V2.Core.RoutingPriority, enum: true)
  field(:rate_limits, 13, repeated: true, type: Envoy.Api.V2.Route.RateLimit)
  field(:include_vh_rate_limits, 14, type: Google.Protobuf.BoolValue)
  field(:hash_policy, 15, repeated: true, type: Envoy.Api.V2.Route.RouteAction.HashPolicy)
  field(:cors, 17, type: Envoy.Api.V2.Route.CorsPolicy)
  field(:max_grpc_timeout, 23, type: Google.Protobuf.Duration)
  field(:grpc_timeout_offset, 28, type: Google.Protobuf.Duration)
  field(:upgrade_configs, 25, repeated: true, type: Envoy.Api.V2.Route.RouteAction.UpgradeConfig)

  field(:internal_redirect_action, 26,
    type: Envoy.Api.V2.Route.RouteAction.InternalRedirectAction,
    enum: true
  )

  field(:max_internal_redirects, 31, type: Google.Protobuf.UInt32Value)
  field(:hedge_policy, 27, type: Envoy.Api.V2.Route.HedgePolicy)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryPriority do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:config, 2, type: Google.Protobuf.Struct, deprecated: true, oneof: 0)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryBackOff do
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

defmodule Envoy.Api.V2.Route.RetryPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          retry_on: String.t(),
          num_retries: Google.Protobuf.UInt32Value.t() | nil,
          per_try_timeout: Google.Protobuf.Duration.t() | nil,
          retry_priority: Envoy.Api.V2.Route.RetryPolicy.RetryPriority.t() | nil,
          retry_host_predicate: [Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate.t()],
          host_selection_retry_max_attempts: integer,
          retriable_status_codes: [non_neg_integer],
          retry_back_off: Envoy.Api.V2.Route.RetryPolicy.RetryBackOff.t() | nil,
          retriable_headers: [Envoy.Api.V2.Route.HeaderMatcher.t()],
          retriable_request_headers: [Envoy.Api.V2.Route.HeaderMatcher.t()]
        }
  defstruct [
    :retry_on,
    :num_retries,
    :per_try_timeout,
    :retry_priority,
    :retry_host_predicate,
    :host_selection_retry_max_attempts,
    :retriable_status_codes,
    :retry_back_off,
    :retriable_headers,
    :retriable_request_headers
  ]

  field(:retry_on, 1, type: :string)
  field(:num_retries, 2, type: Google.Protobuf.UInt32Value)
  field(:per_try_timeout, 3, type: Google.Protobuf.Duration)
  field(:retry_priority, 4, type: Envoy.Api.V2.Route.RetryPolicy.RetryPriority)

  field(:retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate
  )

  field(:host_selection_retry_max_attempts, 6, type: :int64)
  field(:retriable_status_codes, 7, repeated: true, type: :uint32)
  field(:retry_back_off, 8, type: Envoy.Api.V2.Route.RetryPolicy.RetryBackOff)
  field(:retriable_headers, 9, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:retriable_request_headers, 10, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Api.V2.Route.HedgePolicy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          initial_requests: Google.Protobuf.UInt32Value.t() | nil,
          additional_request_chance: Envoy.Type.FractionalPercent.t() | nil,
          hedge_on_per_try_timeout: boolean
        }
  defstruct [:initial_requests, :additional_request_chance, :hedge_on_per_try_timeout]

  field(:initial_requests, 1, type: Google.Protobuf.UInt32Value)
  field(:additional_request_chance, 2, type: Envoy.Type.FractionalPercent)
  field(:hedge_on_per_try_timeout, 3, type: :bool)
end

defmodule Envoy.Api.V2.Route.RedirectAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scheme_rewrite_specifier: {atom, any},
          path_rewrite_specifier: {atom, any},
          host_redirect: String.t(),
          port_redirect: non_neg_integer,
          response_code: Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode.t(),
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

  field(:response_code, 3,
    type: Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode,
    enum: true
  )

  field(:strip_query, 6, type: :bool)
end

defmodule Envoy.Api.V2.Route.DirectResponseAction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: non_neg_integer,
          body: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [:status, :body]

  field(:status, 1, type: :uint32)
  field(:body, 2, type: Envoy.Api.V2.Core.DataSource)
end

defmodule Envoy.Api.V2.Route.Decorator do
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

defmodule Envoy.Api.V2.Route.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          client_sampling: Envoy.Type.FractionalPercent.t() | nil,
          random_sampling: Envoy.Type.FractionalPercent.t() | nil,
          overall_sampling: Envoy.Type.FractionalPercent.t() | nil,
          custom_tags: [Envoy.Type.Tracing.V2.CustomTag.t()]
        }
  defstruct [:client_sampling, :random_sampling, :overall_sampling, :custom_tags]

  field(:client_sampling, 1, type: Envoy.Type.FractionalPercent)
  field(:random_sampling, 2, type: Envoy.Type.FractionalPercent)
  field(:overall_sampling, 3, type: Envoy.Type.FractionalPercent)
  field(:custom_tags, 4, repeated: true, type: Envoy.Type.Tracing.V2.CustomTag)
end

defmodule Envoy.Api.V2.Route.VirtualCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pattern: String.t(),
          headers: [Envoy.Api.V2.Route.HeaderMatcher.t()],
          name: String.t(),
          method: Envoy.Api.V2.Core.RequestMethod.t()
        }
  defstruct [:pattern, :headers, :name, :method]

  field(:pattern, 1, type: :string, deprecated: true)
  field(:headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
  field(:name, 2, type: :string)
  field(:method, 3, type: Envoy.Api.V2.Core.RequestMethod, deprecated: true, enum: true)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.SourceCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header_name: String.t(),
          descriptor_key: String.t()
        }
  defstruct [:header_name, :descriptor_key]

  field(:header_name, 1, type: :string)
  field(:descriptor_key, 2, type: :string)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.GenericKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_value: String.t()
        }
  defstruct [:descriptor_value]

  field(:descriptor_value, 1, type: :string)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_value: String.t(),
          expect_match: Google.Protobuf.BoolValue.t() | nil,
          headers: [Envoy.Api.V2.Route.HeaderMatcher.t()]
        }
  defstruct [:descriptor_value, :expect_match, :headers]

  field(:descriptor_value, 1, type: :string)
  field(:expect_match, 2, type: Google.Protobuf.BoolValue)
  field(:headers, 3, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher)
end

defmodule Envoy.Api.V2.Route.RateLimit.Action do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action_specifier: {atom, any}
        }
  defstruct [:action_specifier]

  oneof(:action_specifier, 0)
  field(:source_cluster, 1, type: Envoy.Api.V2.Route.RateLimit.Action.SourceCluster, oneof: 0)

  field(:destination_cluster, 2,
    type: Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster,
    oneof: 0
  )

  field(:request_headers, 3, type: Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders, oneof: 0)
  field(:remote_address, 4, type: Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress, oneof: 0)
  field(:generic_key, 5, type: Envoy.Api.V2.Route.RateLimit.Action.GenericKey, oneof: 0)

  field(:header_value_match, 6,
    type: Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch,
    oneof: 0
  )
end

defmodule Envoy.Api.V2.Route.RateLimit do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stage: Google.Protobuf.UInt32Value.t() | nil,
          disable_key: String.t(),
          actions: [Envoy.Api.V2.Route.RateLimit.Action.t()]
        }
  defstruct [:stage, :disable_key, :actions]

  field(:stage, 1, type: Google.Protobuf.UInt32Value)
  field(:disable_key, 2, type: :string)
  field(:actions, 3, repeated: true, type: Envoy.Api.V2.Route.RateLimit.Action)
end

defmodule Envoy.Api.V2.Route.HeaderMatcher do
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
  field(:regex_match, 5, type: :string, deprecated: true, oneof: 0)
  field(:safe_regex_match, 11, type: Envoy.Type.Matcher.RegexMatcher, oneof: 0)
  field(:range_match, 6, type: Envoy.Type.Int64Range, oneof: 0)
  field(:present_match, 7, type: :bool, oneof: 0)
  field(:prefix_match, 9, type: :string, oneof: 0)
  field(:suffix_match, 10, type: :string, oneof: 0)
  field(:invert_match, 8, type: :bool)
end

defmodule Envoy.Api.V2.Route.QueryParameterMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          query_parameter_match_specifier: {atom, any},
          name: String.t(),
          value: String.t(),
          regex: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:query_parameter_match_specifier, :name, :value, :regex]

  oneof(:query_parameter_match_specifier, 0)
  field(:name, 1, type: :string)
  field(:value, 3, type: :string, deprecated: true)
  field(:regex, 4, type: Google.Protobuf.BoolValue, deprecated: true)
  field(:string_match, 5, type: Envoy.Type.Matcher.StringMatcher, oneof: 0)
  field(:present_match, 6, type: :bool, oneof: 0)
end
