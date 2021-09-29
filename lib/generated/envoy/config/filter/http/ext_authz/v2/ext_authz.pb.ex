defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthz do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          services: {atom, any},
          failure_mode_allow: boolean,
          use_alpha: boolean,
          with_request_body: Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings.t() | nil,
          clear_route_cache: boolean,
          status_on_error: Envoy.Type.HttpStatus.t() | nil,
          metadata_context_namespaces: [String.t()],
          filter_enabled: Envoy.Api.V2.Core.RuntimeFractionalPercent.t() | nil,
          deny_at_disable: Envoy.Api.V2.Core.RuntimeFeatureFlag.t() | nil,
          include_peer_certificate: boolean
        }
  defstruct [
    :services,
    :failure_mode_allow,
    :use_alpha,
    :with_request_body,
    :clear_route_cache,
    :status_on_error,
    :metadata_context_namespaces,
    :filter_enabled,
    :deny_at_disable,
    :include_peer_certificate
  ]

  oneof(:services, 0)
  field(:grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, oneof: 0)
  field(:http_service, 3, type: Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService, oneof: 0)
  field(:failure_mode_allow, 2, type: :bool)
  field(:use_alpha, 4, type: :bool, deprecated: true)
  field(:with_request_body, 5, type: Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings)
  field(:clear_route_cache, 6, type: :bool)
  field(:status_on_error, 7, type: Envoy.Type.HttpStatus)
  field(:metadata_context_namespaces, 8, repeated: true, type: :string)
  field(:filter_enabled, 9, type: Envoy.Api.V2.Core.RuntimeFractionalPercent)
  field(:deny_at_disable, 11, type: Envoy.Api.V2.Core.RuntimeFeatureFlag)
  field(:include_peer_certificate, 10, type: :bool)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_request_bytes: non_neg_integer,
          allow_partial_message: boolean
        }
  defstruct [:max_request_bytes, :allow_partial_message]

  field(:max_request_bytes, 1, type: :uint32)
  field(:allow_partial_message, 2, type: :bool)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          server_uri: Envoy.Api.V2.Core.HttpUri.t() | nil,
          path_prefix: String.t(),
          authorization_request:
            Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest.t() | nil,
          authorization_response:
            Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse.t() | nil
        }
  defstruct [:server_uri, :path_prefix, :authorization_request, :authorization_response]

  field(:server_uri, 1, type: Envoy.Api.V2.Core.HttpUri)
  field(:path_prefix, 2, type: :string)

  field(:authorization_request, 7, type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest)

  field(:authorization_response, 8,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse
  )
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allowed_headers: Envoy.Type.Matcher.ListStringMatcher.t() | nil,
          headers_to_add: [Envoy.Api.V2.Core.HeaderValue.t()]
        }
  defstruct [:allowed_headers, :headers_to_add]

  field(:allowed_headers, 1, type: Envoy.Type.Matcher.ListStringMatcher)
  field(:headers_to_add, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValue)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allowed_upstream_headers: Envoy.Type.Matcher.ListStringMatcher.t() | nil,
          allowed_client_headers: Envoy.Type.Matcher.ListStringMatcher.t() | nil
        }
  defstruct [:allowed_upstream_headers, :allowed_client_headers]

  field(:allowed_upstream_headers, 1, type: Envoy.Type.Matcher.ListStringMatcher)
  field(:allowed_client_headers, 2, type: Envoy.Type.Matcher.ListStringMatcher)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthzPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override: {atom, any}
        }
  defstruct [:override]

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:check_settings, 2, type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings, oneof: 0)
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry do
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

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          context_extensions: %{String.t() => String.t()}
        }
  defstruct [:context_extensions]

  field(:context_extensions, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry,
    map: true
  )
end
