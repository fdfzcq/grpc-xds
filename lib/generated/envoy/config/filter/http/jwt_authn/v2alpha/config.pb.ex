defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          jwks_source_specifier: {atom, any},
          issuer: String.t(),
          audiences: [String.t()],
          forward: boolean,
          from_headers: [Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader.t()],
          from_params: [String.t()],
          forward_payload_header: String.t(),
          payload_in_metadata: String.t()
        }
  defstruct [
    :jwks_source_specifier,
    :issuer,
    :audiences,
    :forward,
    :from_headers,
    :from_params,
    :forward_payload_header,
    :payload_in_metadata
  ]

  oneof(:jwks_source_specifier, 0)
  field(:issuer, 1, type: :string)
  field(:audiences, 2, repeated: true, type: :string)
  field(:remote_jwks, 3, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks, oneof: 0)
  field(:local_jwks, 4, type: Envoy.Api.V2.Core.DataSource, oneof: 0)
  field(:forward, 5, type: :bool)

  field(:from_headers, 6,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader
  )

  field(:from_params, 7, repeated: true, type: :string)
  field(:forward_payload_header, 8, type: :string)
  field(:payload_in_metadata, 9, type: :string)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_uri: Envoy.Api.V2.Core.HttpUri.t() | nil,
          cache_duration: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:http_uri, :cache_duration]

  field(:http_uri, 1, type: Envoy.Api.V2.Core.HttpUri)
  field(:cache_duration, 2, type: Google.Protobuf.Duration)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader do
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

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences do
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

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requires_type: {atom, any}
        }
  defstruct [:requires_type]

  oneof(:requires_type, 0)
  field(:provider_name, 1, type: :string, oneof: 0)

  field(:provider_and_audiences, 2,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences,
    oneof: 0
  )

  field(:requires_any, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList,
    oneof: 0
  )

  field(:requires_all, 4,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList,
    oneof: 0
  )

  field(:allow_missing_or_failed, 5, type: Google.Protobuf.Empty, oneof: 0)
  field(:allow_missing, 6, type: Google.Protobuf.Empty, oneof: 0)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirements: [Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement.t()]
        }
  defstruct [:requirements]

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          requirements: [Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement.t()]
        }
  defstruct [:requirements]

  field(:requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match: Envoy.Api.V2.Route.RouteMatch.t() | nil,
          requires: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement.t() | nil
        }
  defstruct [:match, :requires]

  field(:match, 1, type: Envoy.Api.V2.Route.RouteMatch)
  field(:requires, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          requires: %{
            String.t() => Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement.t() | nil
          }
        }
  defstruct [:name, :requires]

  field(:name, 1, type: :string)

  field(:requires, 3,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry,
    map: true
  )
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider)
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          providers: %{
            String.t() => Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider.t() | nil
          },
          rules: [Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule.t()],
          filter_state_rules: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.t() | nil,
          bypass_cors_preflight: boolean
        }
  defstruct [:providers, :rules, :filter_state_rules, :bypass_cors_preflight]

  field(:providers, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry,
    map: true
  )

  field(:rules, 2, repeated: true, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule)

  field(:filter_state_rules, 3, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule)
  field(:bypass_cors_preflight, 4, type: :bool)
end
