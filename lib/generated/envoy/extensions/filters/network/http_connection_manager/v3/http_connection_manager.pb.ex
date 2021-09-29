defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.CodecType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :AUTO | :HTTP1 | :HTTP2 | :HTTP3

  field(:AUTO, 0)
  field(:HTTP1, 1)
  field(:HTTP2, 2)
  field(:HTTP3, 3)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ServerHeaderTransformation do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :OVERWRITE | :APPEND_IF_ABSENT | :PASS_THROUGH

  field(:OVERWRITE, 0)
  field(:APPEND_IF_ABSENT, 1)
  field(:PASS_THROUGH, 2)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ForwardClientCertDetails do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :SANITIZE
          | :FORWARD_ONLY
          | :APPEND_FORWARD
          | :SANITIZE_SET
          | :ALWAYS_FORWARD_ONLY

  field(:SANITIZE, 0)
  field(:FORWARD_ONLY, 1)
  field(:APPEND_FORWARD, 2)
  field(:SANITIZE_SET, 3)
  field(:ALWAYS_FORWARD_ONLY, 4)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing.OperationName do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :INGRESS | :EGRESS

  field(:INGRESS, 0)
  field(:EGRESS, 1)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          client_sampling: Envoy.Type.V3.Percent.t() | nil,
          random_sampling: Envoy.Type.V3.Percent.t() | nil,
          overall_sampling: Envoy.Type.V3.Percent.t() | nil,
          verbose: boolean,
          max_path_tag_length: Google.Protobuf.UInt32Value.t() | nil,
          custom_tags: [Envoy.Type.Tracing.V3.CustomTag.t()],
          provider: Envoy.Config.Trace.V3.Tracing.Http.t() | nil
        }
  defstruct [
    :client_sampling,
    :random_sampling,
    :overall_sampling,
    :verbose,
    :max_path_tag_length,
    :custom_tags,
    :provider
  ]

  field(:client_sampling, 3, type: Envoy.Type.V3.Percent)
  field(:random_sampling, 4, type: Envoy.Type.V3.Percent)
  field(:overall_sampling, 5, type: Envoy.Type.V3.Percent)
  field(:verbose, 6, type: :bool)
  field(:max_path_tag_length, 7, type: Google.Protobuf.UInt32Value)
  field(:custom_tags, 8, repeated: true, type: Envoy.Type.Tracing.V3.CustomTag)
  field(:provider, 9, type: Envoy.Config.Trace.V3.Tracing.Http)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.InternalAddressConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          unix_sockets: boolean
        }
  defstruct [:unix_sockets]

  field(:unix_sockets, 1, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.SetCurrentClientCertDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          subject: Google.Protobuf.BoolValue.t() | nil,
          cert: boolean,
          chain: boolean,
          dns: boolean,
          uri: boolean
        }
  defstruct [:subject, :cert, :chain, :dns, :uri]

  field(:subject, 1, type: Google.Protobuf.BoolValue)
  field(:cert, 3, type: :bool)
  field(:chain, 6, type: :bool)
  field(:dns, 4, type: :bool)
  field(:uri, 5, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.UpgradeConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upgrade_type: String.t(),
          filters: [Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter.t()],
          enabled: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:upgrade_type, :filters, :enabled]

  field(:upgrade_type, 1, type: :string)

  field(:filters, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter
  )

  field(:enabled, 3, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          route_specifier: {atom, any},
          strip_port_mode: {atom, any},
          codec_type:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.CodecType.t(),
          stat_prefix: String.t(),
          http_filters: [Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter.t()],
          add_user_agent: Google.Protobuf.BoolValue.t() | nil,
          tracing:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing.t()
            | nil,
          common_http_protocol_options: Envoy.Config.Core.V3.HttpProtocolOptions.t() | nil,
          http_protocol_options: Envoy.Config.Core.V3.Http1ProtocolOptions.t() | nil,
          http2_protocol_options: Envoy.Config.Core.V3.Http2ProtocolOptions.t() | nil,
          server_name: String.t(),
          server_header_transformation:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ServerHeaderTransformation.t(),
          max_request_headers_kb: Google.Protobuf.UInt32Value.t() | nil,
          stream_idle_timeout: Google.Protobuf.Duration.t() | nil,
          request_timeout: Google.Protobuf.Duration.t() | nil,
          request_headers_timeout: Google.Protobuf.Duration.t() | nil,
          drain_timeout: Google.Protobuf.Duration.t() | nil,
          delayed_close_timeout: Google.Protobuf.Duration.t() | nil,
          access_log: [Envoy.Config.Accesslog.V3.AccessLog.t()],
          use_remote_address: Google.Protobuf.BoolValue.t() | nil,
          xff_num_trusted_hops: non_neg_integer,
          internal_address_config:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.InternalAddressConfig.t()
            | nil,
          skip_xff_append: boolean,
          via: String.t(),
          generate_request_id: Google.Protobuf.BoolValue.t() | nil,
          preserve_external_request_id: boolean,
          always_set_request_id_in_response: boolean,
          forward_client_cert_details:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ForwardClientCertDetails.t(),
          set_current_client_cert_details:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.SetCurrentClientCertDetails.t()
            | nil,
          proxy_100_continue: boolean,
          represent_ipv4_remote_address_as_ipv4_mapped_ipv6: boolean,
          upgrade_configs: [
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.UpgradeConfig.t()
          ],
          normalize_path: Google.Protobuf.BoolValue.t() | nil,
          merge_slashes: boolean,
          request_id_extension:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension.t() | nil,
          local_reply_config:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.LocalReplyConfig.t() | nil,
          strip_matching_host_port: boolean,
          stream_error_on_invalid_http_message: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [
    :route_specifier,
    :strip_port_mode,
    :codec_type,
    :stat_prefix,
    :http_filters,
    :add_user_agent,
    :tracing,
    :common_http_protocol_options,
    :http_protocol_options,
    :http2_protocol_options,
    :server_name,
    :server_header_transformation,
    :max_request_headers_kb,
    :stream_idle_timeout,
    :request_timeout,
    :request_headers_timeout,
    :drain_timeout,
    :delayed_close_timeout,
    :access_log,
    :use_remote_address,
    :xff_num_trusted_hops,
    :internal_address_config,
    :skip_xff_append,
    :via,
    :generate_request_id,
    :preserve_external_request_id,
    :always_set_request_id_in_response,
    :forward_client_cert_details,
    :set_current_client_cert_details,
    :proxy_100_continue,
    :represent_ipv4_remote_address_as_ipv4_mapped_ipv6,
    :upgrade_configs,
    :normalize_path,
    :merge_slashes,
    :request_id_extension,
    :local_reply_config,
    :strip_matching_host_port,
    :stream_error_on_invalid_http_message
  ]

  oneof(:route_specifier, 0)
  oneof(:strip_port_mode, 1)

  field(:codec_type, 1,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.CodecType,
    enum: true
  )

  field(:stat_prefix, 2, type: :string)
  field(:rds, 3, type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.Rds, oneof: 0)
  field(:route_config, 4, type: Envoy.Config.Route.V3.RouteConfiguration, oneof: 0)

  field(:scoped_routes, 31,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes,
    oneof: 0
  )

  field(:http_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter
  )

  field(:add_user_agent, 6, type: Google.Protobuf.BoolValue)

  field(:tracing, 7,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.Tracing
  )

  field(:common_http_protocol_options, 35, type: Envoy.Config.Core.V3.HttpProtocolOptions)
  field(:http_protocol_options, 8, type: Envoy.Config.Core.V3.Http1ProtocolOptions)
  field(:http2_protocol_options, 9, type: Envoy.Config.Core.V3.Http2ProtocolOptions)
  field(:server_name, 10, type: :string)

  field(:server_header_transformation, 34,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ServerHeaderTransformation,
    enum: true
  )

  field(:max_request_headers_kb, 29, type: Google.Protobuf.UInt32Value)
  field(:stream_idle_timeout, 24, type: Google.Protobuf.Duration)
  field(:request_timeout, 28, type: Google.Protobuf.Duration)
  field(:request_headers_timeout, 41, type: Google.Protobuf.Duration)
  field(:drain_timeout, 12, type: Google.Protobuf.Duration)
  field(:delayed_close_timeout, 26, type: Google.Protobuf.Duration)
  field(:access_log, 13, repeated: true, type: Envoy.Config.Accesslog.V3.AccessLog)
  field(:use_remote_address, 14, type: Google.Protobuf.BoolValue)
  field(:xff_num_trusted_hops, 19, type: :uint32)

  field(:internal_address_config, 25,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.InternalAddressConfig
  )

  field(:skip_xff_append, 21, type: :bool)
  field(:via, 22, type: :string)
  field(:generate_request_id, 15, type: Google.Protobuf.BoolValue)
  field(:preserve_external_request_id, 32, type: :bool)
  field(:always_set_request_id_in_response, 37, type: :bool)

  field(:forward_client_cert_details, 16,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.ForwardClientCertDetails,
    enum: true
  )

  field(:set_current_client_cert_details, 17,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.SetCurrentClientCertDetails
  )

  field(:proxy_100_continue, 18, type: :bool)
  field(:represent_ipv4_remote_address_as_ipv4_mapped_ipv6, 20, type: :bool)

  field(:upgrade_configs, 23,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager.UpgradeConfig
  )

  field(:normalize_path, 30, type: Google.Protobuf.BoolValue)
  field(:merge_slashes, 33, type: :bool)

  field(:request_id_extension, 36,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension
  )

  field(:local_reply_config, 38,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.LocalReplyConfig
  )

  field(:strip_matching_host_port, 39, type: :bool)
  field(:strip_any_host_port, 42, type: :bool, oneof: 1)
  field(:stream_error_on_invalid_http_message, 40, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.LocalReplyConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          mappers: [Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ResponseMapper.t()],
          body_format: Envoy.Config.Core.V3.SubstitutionFormatString.t() | nil
        }
  defstruct [:mappers, :body_format]

  field(:mappers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ResponseMapper
  )

  field(:body_format, 2, type: Envoy.Config.Core.V3.SubstitutionFormatString)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ResponseMapper do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          filter: Envoy.Config.Accesslog.V3.AccessLogFilter.t() | nil,
          status_code: Google.Protobuf.UInt32Value.t() | nil,
          body: Envoy.Config.Core.V3.DataSource.t() | nil,
          body_format_override: Envoy.Config.Core.V3.SubstitutionFormatString.t() | nil,
          headers_to_add: [Envoy.Config.Core.V3.HeaderValueOption.t()]
        }
  defstruct [:filter, :status_code, :body, :body_format_override, :headers_to_add]

  field(:filter, 1, type: Envoy.Config.Accesslog.V3.AccessLogFilter)
  field(:status_code, 2, type: Google.Protobuf.UInt32Value)
  field(:body, 3, type: Envoy.Config.Core.V3.DataSource)
  field(:body_format_override, 4, type: Envoy.Config.Core.V3.SubstitutionFormatString)
  field(:headers_to_add, 5, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.Rds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil,
          route_config_name: String.t()
        }
  defstruct [:config_source, :route_config_name]

  field(:config_source, 1, type: Envoy.Config.Core.V3.ConfigSource)
  field(:route_config_name, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRouteConfigurationsList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scoped_route_configurations: [Envoy.Config.Route.V3.ScopedRouteConfiguration.t()]
        }
  defstruct [:scoped_route_configurations]

  field(:scoped_route_configurations, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.ScopedRouteConfiguration
  )
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          separator: String.t(),
          key: String.t()
        }
  defstruct [:separator, :key]

  field(:separator, 1, type: :string)
  field(:key, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          extract_type: {atom, any},
          name: String.t(),
          element_separator: String.t()
        }
  defstruct [:extract_type, :name, :element_separator]

  oneof(:extract_type, 0)
  field(:name, 1, type: :string)
  field(:element_separator, 2, type: :string)
  field(:index, 3, type: :uint32, oneof: 0)

  field(:element, 4,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any}
        }
  defstruct [:type]

  oneof(:type, 0)

  field(:header_value_extractor, 1,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          fragments: [
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.t()
          ]
        }
  defstruct [:fragments]

  field(:fragments, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder
  )
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_specifier: {atom, any},
          name: String.t(),
          scope_key_builder:
            Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder.t()
            | nil,
          rds_config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil
        }
  defstruct [:config_specifier, :name, :scope_key_builder, :rds_config_source]

  oneof(:config_specifier, 0)
  field(:name, 1, type: :string)

  field(:scope_key_builder, 2,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRoutes.ScopeKeyBuilder
  )

  field(:rds_config_source, 3, type: Envoy.Config.Core.V3.ConfigSource)

  field(:scoped_route_configurations_list, 4,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRouteConfigurationsList,
    oneof: 0
  )

  field(:scoped_rds, 5,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRds,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.ScopedRds do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          scoped_rds_config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil
        }
  defstruct [:scoped_rds_config_source]

  field(:scoped_rds_config_source, 1, type: Envoy.Config.Core.V3.ConfigSource)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t(),
          is_optional: boolean
        }
  defstruct [:config_type, :name, :is_optional]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 4, type: Google.Protobuf.Any, oneof: 0)
  field(:config_discovery, 5, type: Envoy.Config.Core.V3.ExtensionConfigSource, oneof: 0)
  field(:is_optional, 6, type: :bool)
end

defmodule Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:typed_config]

  field(:typed_config, 1, type: Google.Protobuf.Any)
end
