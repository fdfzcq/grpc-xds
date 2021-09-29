defmodule Envoy.Config.Rbac.V3.RBAC.Action do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ALLOW | :DENY | :LOG

  field(:ALLOW, 0)
  field(:DENY, 1)
  field(:LOG, 2)
end

defmodule Envoy.Config.Rbac.V3.RBAC.PoliciesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Rbac.V3.Policy.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Rbac.V3.Policy)
end

defmodule Envoy.Config.Rbac.V3.RBAC do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          action: Envoy.Config.Rbac.V3.RBAC.Action.t(),
          policies: %{String.t() => Envoy.Config.Rbac.V3.Policy.t() | nil}
        }
  defstruct [:action, :policies]

  field(:action, 1, type: Envoy.Config.Rbac.V3.RBAC.Action, enum: true)
  field(:policies, 2, repeated: true, type: Envoy.Config.Rbac.V3.RBAC.PoliciesEntry, map: true)
end

defmodule Envoy.Config.Rbac.V3.Policy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          permissions: [Envoy.Config.Rbac.V3.Permission.t()],
          principals: [Envoy.Config.Rbac.V3.Principal.t()],
          condition: Google.Api.Expr.V1alpha1.Expr.t() | nil,
          checked_condition: Google.Api.Expr.V1alpha1.CheckedExpr.t() | nil
        }
  defstruct [:permissions, :principals, :condition, :checked_condition]

  field(:permissions, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission)
  field(:principals, 2, repeated: true, type: Envoy.Config.Rbac.V3.Principal)
  field(:condition, 3, type: Google.Api.Expr.V1alpha1.Expr)
  field(:checked_condition, 4, type: Google.Api.Expr.V1alpha1.CheckedExpr)
end

defmodule Envoy.Config.Rbac.V3.Permission.Set do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Config.Rbac.V3.Permission.t()]
        }
  defstruct [:rules]

  field(:rules, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission)
end

defmodule Envoy.Config.Rbac.V3.Permission do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:and_rules, 1, type: Envoy.Config.Rbac.V3.Permission.Set, oneof: 0)
  field(:or_rules, 2, type: Envoy.Config.Rbac.V3.Permission.Set, oneof: 0)
  field(:any, 3, type: :bool, oneof: 0)
  field(:header, 4, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0)
  field(:url_path, 10, type: Envoy.Type.Matcher.V3.PathMatcher, oneof: 0)
  field(:destination_ip, 5, type: Envoy.Config.Core.V3.CidrRange, oneof: 0)
  field(:destination_port, 6, type: :uint32, oneof: 0)
  field(:metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0)
  field(:not_rule, 8, type: Envoy.Config.Rbac.V3.Permission, oneof: 0)
  field(:requested_server_name, 9, type: Envoy.Type.Matcher.V3.StringMatcher, oneof: 0)
end

defmodule Envoy.Config.Rbac.V3.Principal.Set do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ids: [Envoy.Config.Rbac.V3.Principal.t()]
        }
  defstruct [:ids]

  field(:ids, 1, repeated: true, type: Envoy.Config.Rbac.V3.Principal)
end

defmodule Envoy.Config.Rbac.V3.Principal.Authenticated do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          principal_name: Envoy.Type.Matcher.V3.StringMatcher.t() | nil
        }
  defstruct [:principal_name]

  field(:principal_name, 2, type: Envoy.Type.Matcher.V3.StringMatcher)
end

defmodule Envoy.Config.Rbac.V3.Principal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          identifier: {atom, any}
        }
  defstruct [:identifier]

  oneof(:identifier, 0)
  field(:and_ids, 1, type: Envoy.Config.Rbac.V3.Principal.Set, oneof: 0)
  field(:or_ids, 2, type: Envoy.Config.Rbac.V3.Principal.Set, oneof: 0)
  field(:any, 3, type: :bool, oneof: 0)
  field(:authenticated, 4, type: Envoy.Config.Rbac.V3.Principal.Authenticated, oneof: 0)
  field(:source_ip, 5, type: Envoy.Config.Core.V3.CidrRange, deprecated: true, oneof: 0)
  field(:direct_remote_ip, 10, type: Envoy.Config.Core.V3.CidrRange, oneof: 0)
  field(:remote_ip, 11, type: Envoy.Config.Core.V3.CidrRange, oneof: 0)
  field(:header, 6, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0)
  field(:url_path, 9, type: Envoy.Type.Matcher.V3.PathMatcher, oneof: 0)
  field(:metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0)
  field(:not_id, 8, type: Envoy.Config.Rbac.V3.Principal, oneof: 0)
end
