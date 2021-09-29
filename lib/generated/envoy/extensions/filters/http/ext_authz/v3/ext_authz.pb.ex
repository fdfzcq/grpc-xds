defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          services: {atom, any},
          transport_api_version: Envoy.Config.Core.V3.ApiVersion.t(),
          failure_mode_allow: boolean,
          with_request_body: Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings.t() | nil,
          clear_route_cache: boolean,
          status_on_error: Envoy.Type.V3.HttpStatus.t() | nil,
          metadata_context_namespaces: [String.t()],
          filter_enabled: Envoy.Config.Core.V3.RuntimeFractionalPercent.t() | nil,
          filter_enabled_metadata: Envoy.Type.Matcher.V3.MetadataMatcher.t() | nil,
          deny_at_disable: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil,
          include_peer_certificate: boolean,
          stat_prefix: String.t()
        }
  defstruct [
    :services,
    :transport_api_version,
    :failure_mode_allow,
    :with_request_body,
    :clear_route_cache,
    :status_on_error,
    :metadata_context_namespaces,
    :filter_enabled,
    :filter_enabled_metadata,
    :deny_at_disable,
    :include_peer_certificate,
    :stat_prefix
  ]

  oneof(:services, 0)
  field(:grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, oneof: 0)
  field(:http_service, 3, type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService, oneof: 0)
  field(:transport_api_version, 12, type: Envoy.Config.Core.V3.ApiVersion, enum: true)
  field(:failure_mode_allow, 2, type: :bool)
  field(:with_request_body, 5, type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings)
  field(:clear_route_cache, 6, type: :bool)
  field(:status_on_error, 7, type: Envoy.Type.V3.HttpStatus)
  field(:metadata_context_namespaces, 8, repeated: true, type: :string)
  field(:filter_enabled, 9, type: Envoy.Config.Core.V3.RuntimeFractionalPercent)
  field(:filter_enabled_metadata, 14, type: Envoy.Type.Matcher.V3.MetadataMatcher)
  field(:deny_at_disable, 11, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
  field(:include_peer_certificate, 10, type: :bool)
  field(:stat_prefix, 13, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_request_bytes: non_neg_integer,
          allow_partial_message: boolean,
          pack_as_bytes: boolean
        }
  defstruct [:max_request_bytes, :allow_partial_message, :pack_as_bytes]

  field(:max_request_bytes, 1, type: :uint32)
  field(:allow_partial_message, 2, type: :bool)
  field(:pack_as_bytes, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          server_uri: Envoy.Config.Core.V3.HttpUri.t() | nil,
          path_prefix: String.t(),
          authorization_request:
            Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest.t() | nil,
          authorization_response:
            Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse.t() | nil
        }
  defstruct [:server_uri, :path_prefix, :authorization_request, :authorization_response]

  field(:server_uri, 1, type: Envoy.Config.Core.V3.HttpUri)
  field(:path_prefix, 2, type: :string)

  field(:authorization_request, 7,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest
  )

  field(:authorization_response, 8,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allowed_headers: Envoy.Type.Matcher.V3.ListStringMatcher.t() | nil,
          headers_to_add: [Envoy.Config.Core.V3.HeaderValue.t()]
        }
  defstruct [:allowed_headers, :headers_to_add]

  field(:allowed_headers, 1, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:headers_to_add, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValue)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allowed_upstream_headers: Envoy.Type.Matcher.V3.ListStringMatcher.t() | nil,
          allowed_upstream_headers_to_append: Envoy.Type.Matcher.V3.ListStringMatcher.t() | nil,
          allowed_client_headers: Envoy.Type.Matcher.V3.ListStringMatcher.t() | nil,
          allowed_client_headers_on_success: Envoy.Type.Matcher.V3.ListStringMatcher.t() | nil
        }
  defstruct [
    :allowed_upstream_headers,
    :allowed_upstream_headers_to_append,
    :allowed_client_headers,
    :allowed_client_headers_on_success
  ]

  field(:allowed_upstream_headers, 1, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_upstream_headers_to_append, 3, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_client_headers, 2, type: Envoy.Type.Matcher.V3.ListStringMatcher)
  field(:allowed_client_headers_on_success, 4, type: Envoy.Type.Matcher.V3.ListStringMatcher)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthzPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override: {atom, any}
        }
  defstruct [:override]

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)

  field(:check_settings, 2,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings,
    oneof: 0
  )
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          context_extensions: %{String.t() => String.t()},
          disable_request_body_buffering: boolean
        }
  defstruct [:context_extensions, :disable_request_body_buffering]

  field(:context_extensions, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry,
    map: true
  )

  field(:disable_request_body_buffering, 2, type: :bool)
end
