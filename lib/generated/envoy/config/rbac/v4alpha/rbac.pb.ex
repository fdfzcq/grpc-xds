defmodule Envoy.Config.Rbac.V4alpha.RBAC.Action do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ALLOW | :DENY | :LOG

  field(:ALLOW, 0)
  field(:DENY, 1)
  field(:LOG, 2)
end

defmodule Envoy.Config.Rbac.V4alpha.RBAC.PoliciesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Rbac.V4alpha.Policy.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Rbac.V4alpha.Policy)
end

defmodule Envoy.Config.Rbac.V4alpha.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: Envoy.Config.Rbac.V4alpha.RBAC.Action.t(),
          policies: %{String.t() => Envoy.Config.Rbac.V4alpha.Policy.t() | nil}
        }
  defstruct [:action, :policies]

  field(:action, 1, type: Envoy.Config.Rbac.V4alpha.RBAC.Action, enum: true)

  field(:policies, 2,
    repeated: true,
    type: Envoy.Config.Rbac.V4alpha.RBAC.PoliciesEntry,
    map: true
  )
end

defmodule Envoy.Config.Rbac.V4alpha.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          expression_specifier: {atom, any},
          permissions: [Envoy.Config.Rbac.V4alpha.Permission.t()],
          principals: [Envoy.Config.Rbac.V4alpha.Principal.t()]
        }
  defstruct [:expression_specifier, :permissions, :principals]

  oneof(:expression_specifier, 0)
  field(:permissions, 1, repeated: true, type: Envoy.Config.Rbac.V4alpha.Permission)
  field(:principals, 2, repeated: true, type: Envoy.Config.Rbac.V4alpha.Principal)
  field(:condition, 3, type: Google.Api.Expr.V1alpha1.Expr, oneof: 0)
  field(:checked_condition, 4, type: Google.Api.Expr.V1alpha1.CheckedExpr, oneof: 0)
end

defmodule Envoy.Config.Rbac.V4alpha.Permission.Set do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Config.Rbac.V4alpha.Permission.t()]
        }
  defstruct [:rules]

  field(:rules, 1, repeated: true, type: Envoy.Config.Rbac.V4alpha.Permission)
end

defmodule Envoy.Config.Rbac.V4alpha.Permission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:and_rules, 1, type: Envoy.Config.Rbac.V4alpha.Permission.Set, oneof: 0)
  field(:or_rules, 2, type: Envoy.Config.Rbac.V4alpha.Permission.Set, oneof: 0)
  field(:any, 3, type: :bool, oneof: 0)
  field(:header, 4, type: Envoy.Config.Route.V4alpha.HeaderMatcher, oneof: 0)
  field(:url_path, 10, type: Envoy.Type.Matcher.V4alpha.PathMatcher, oneof: 0)
  field(:destination_ip, 5, type: Envoy.Config.Core.V4alpha.CidrRange, oneof: 0)
  field(:destination_port, 6, type: :uint32, oneof: 0)
  field(:metadata, 7, type: Envoy.Type.Matcher.V4alpha.MetadataMatcher, oneof: 0)
  field(:not_rule, 8, type: Envoy.Config.Rbac.V4alpha.Permission, oneof: 0)
  field(:requested_server_name, 9, type: Envoy.Type.Matcher.V4alpha.StringMatcher, oneof: 0)
end

defmodule Envoy.Config.Rbac.V4alpha.Principal.Set do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Envoy.Config.Rbac.V4alpha.Principal.t()]
        }
  defstruct [:ids]

  field(:ids, 1, repeated: true, type: Envoy.Config.Rbac.V4alpha.Principal)
end

defmodule Envoy.Config.Rbac.V4alpha.Principal.Authenticated do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          principal_name: Envoy.Type.Matcher.V4alpha.StringMatcher.t() | nil
        }
  defstruct [:principal_name]

  field(:principal_name, 2, type: Envoy.Type.Matcher.V4alpha.StringMatcher)
end

defmodule Envoy.Config.Rbac.V4alpha.Principal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: {atom, any}
        }
  defstruct [:identifier]

  oneof(:identifier, 0)
  field(:and_ids, 1, type: Envoy.Config.Rbac.V4alpha.Principal.Set, oneof: 0)
  field(:or_ids, 2, type: Envoy.Config.Rbac.V4alpha.Principal.Set, oneof: 0)
  field(:any, 3, type: :bool, oneof: 0)
  field(:authenticated, 4, type: Envoy.Config.Rbac.V4alpha.Principal.Authenticated, oneof: 0)
  field(:direct_remote_ip, 10, type: Envoy.Config.Core.V4alpha.CidrRange, oneof: 0)
  field(:remote_ip, 11, type: Envoy.Config.Core.V4alpha.CidrRange, oneof: 0)
  field(:header, 6, type: Envoy.Config.Route.V4alpha.HeaderMatcher, oneof: 0)
  field(:url_path, 9, type: Envoy.Type.Matcher.V4alpha.PathMatcher, oneof: 0)
  field(:metadata, 7, type: Envoy.Type.Matcher.V4alpha.MetadataMatcher, oneof: 0)
  field(:not_id, 8, type: Envoy.Config.Rbac.V4alpha.Principal, oneof: 0)
end
