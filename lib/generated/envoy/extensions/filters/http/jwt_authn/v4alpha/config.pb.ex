defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          jwks_source_specifier: {atom, any},
          issuer: String.t(),
          audiences: [String.t()],
          forward: boolean,
          from_headers: [Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtHeader.t()],
          from_params: [String.t()],
          forward_payload_header: String.t(),
          payload_in_metadata: String.t(),
          clock_skew_seconds: non_neg_integer
        }
  defstruct [
    :jwks_source_specifier,
    :issuer,
    :audiences,
    :forward,
    :from_headers,
    :from_params,
    :forward_payload_header,
    :payload_in_metadata,
    :clock_skew_seconds
  ]

  oneof(:jwks_source_specifier, 0)
  field(:issuer, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)

  field(:remote_jwks, 3, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RemoteJwks, oneof: 0)

  field(:local_jwks, 4, type: Envoy.Config.Core.V4alpha.DataSource, oneof: 0)
  field(:forward, 5, type: :bool)

  field(:from_headers, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtHeader
  )

  field(:from_params, 7, repeated: true, type: :string)
  field(:forward_payload_header, 8, type: :string)
  field(:payload_in_metadata, 9, type: :string)
  field(:clock_skew_seconds, 10, type: :uint32)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RemoteJwks do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_uri: Envoy.Config.Core.V4alpha.HttpUri.t() | nil,
          cache_duration: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:http_uri, :cache_duration]

  field(:http_uri, 1, type: Envoy.Config.Core.V4alpha.HttpUri)
  field(:cache_duration, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtHeader do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          value_prefix: String.t()
        }
  defstruct [:name, :value_prefix]

  field(:name, 1, type: :string)
  field(:value_prefix, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.ProviderWithAudiences do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          provider_name: String.t(),
          audiences: [String.t()]
        }
  defstruct [:provider_name, :audiences]

  field(:provider_name, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requires_type: {atom, any}
        }
  defstruct [:requires_type]

  oneof(:requires_type, 0)
  field(:provider_name, 1, type: :string, oneof: 0)

  field(:provider_and_audiences, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.ProviderWithAudiences,
    oneof: 0
  )

  field(:requires_any, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementOrList,
    oneof: 0
  )

  field(:requires_all, 4,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementAndList,
    oneof: 0
  )

  field(:allow_missing_or_failed, 5, type: Google.Protobuf.Empty, oneof: 0)
  field(:allow_missing, 6, type: Google.Protobuf.Empty, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementOrList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirements: [Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t()]
        }
  defstruct [:requirements]

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirementAndList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirements: [Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t()]
        }
  defstruct [:requirements]

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RequirementRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirement_type: {atom, any},
          match: Envoy.Config.Route.V4alpha.RouteMatch.t() | nil
        }
  defstruct [:requirement_type, :match]

  oneof(:requirement_type, 0)
  field(:match, 1, type: Envoy.Config.Route.V4alpha.RouteMatch)

  field(:requires, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement,
    oneof: 0
  )

  field(:requirement_name, 3, type: :string, oneof: 0)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule.RequiresEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          requires: %{
            String.t() => Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t() | nil
          }
        }
  defstruct [:name, :requires]

  field(:name, 1, type: :string)

  field(:requires, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule.RequiresEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.ProvidersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.RequirementMapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement)
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          providers: %{
            String.t() => Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtProvider.t() | nil
          },
          rules: [Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RequirementRule.t()],
          filter_state_rules:
            Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule.t() | nil,
          bypass_cors_preflight: boolean,
          requirement_map: %{
            String.t() => Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtRequirement.t() | nil
          }
        }
  defstruct [:providers, :rules, :filter_state_rules, :bypass_cors_preflight, :requirement_map]

  field(:providers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.ProvidersEntry,
    map: true
  )

  field(:rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.RequirementRule
  )

  field(:filter_state_rules, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.FilterStateRule
  )

  field(:bypass_cors_preflight, 4, type: :bool)

  field(:requirement_map, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.JwtAuthentication.RequirementMapEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V4alpha.PerRouteConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirement_specifier: {atom, any}
        }
  defstruct [:requirement_specifier]

  oneof(:requirement_specifier, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:requirement_name, 2, type: :string, oneof: 0)
end
