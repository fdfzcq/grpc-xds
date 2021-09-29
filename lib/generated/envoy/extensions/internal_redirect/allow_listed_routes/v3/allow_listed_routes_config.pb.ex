defmodule Envoy.Extensions.InternalRedirect.AllowListedRoutes.V3.AllowListedRoutesConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          allowed_route_names: [String.t()]
        }
  defstruct [:allowed_route_names]

  field(:allowed_route_names, 1, repeated: true, type: :string)
end
