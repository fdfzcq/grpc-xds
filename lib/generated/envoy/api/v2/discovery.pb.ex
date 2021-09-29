defmodule Envoy.Api.V2.DiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          node: Envoy.Api.V2.Core.Node.t() | nil,
          resource_names: [String.t()],
          type_url: String.t(),
          response_nonce: String.t(),
          error_detail: Google.Rpc.Status.t() | nil
        }
  defstruct [:version_info, :node, :resource_names, :type_url, :response_nonce, :error_detail]

  field(:version_info, 1, type: :string)
  field(:node, 2, type: Envoy.Api.V2.Core.Node)
  field(:resource_names, 3, repeated: true, type: :string)
  field(:type_url, 4, type: :string)
  field(:response_nonce, 5, type: :string)
  field(:error_detail, 6, type: Google.Rpc.Status)
end

defmodule Envoy.Api.V2.DiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          resources: [Google.Protobuf.Any.t()],
          canary: boolean,
          type_url: String.t(),
          nonce: String.t(),
          control_plane: Envoy.Api.V2.Core.ControlPlane.t() | nil
        }
  defstruct [:version_info, :resources, :canary, :type_url, :nonce, :control_plane]

  field(:version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Google.Protobuf.Any)
  field(:canary, 3, type: :bool)
  field(:type_url, 4, type: :string)
  field(:nonce, 5, type: :string)
  field(:control_plane, 6, type: Envoy.Api.V2.Core.ControlPlane)
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
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

defmodule Envoy.Api.V2.DeltaDiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Api.V2.Core.Node.t() | nil,
          type_url: String.t(),
          resource_names_subscribe: [String.t()],
          resource_names_unsubscribe: [String.t()],
          initial_resource_versions: %{String.t() => String.t()},
          response_nonce: String.t(),
          error_detail: Google.Rpc.Status.t() | nil
        }
  defstruct [
    :node,
    :type_url,
    :resource_names_subscribe,
    :resource_names_unsubscribe,
    :initial_resource_versions,
    :response_nonce,
    :error_detail
  ]

  field(:node, 1, type: Envoy.Api.V2.Core.Node)
  field(:type_url, 2, type: :string)
  field(:resource_names_subscribe, 3, repeated: true, type: :string)
  field(:resource_names_unsubscribe, 4, repeated: true, type: :string)

  field(:initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    map: true
  )

  field(:response_nonce, 6, type: :string)
  field(:error_detail, 7, type: Google.Rpc.Status)
end

defmodule Envoy.Api.V2.DeltaDiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          system_version_info: String.t(),
          resources: [Envoy.Api.V2.Resource.t()],
          type_url: String.t(),
          removed_resources: [String.t()],
          nonce: String.t()
        }
  defstruct [:system_version_info, :resources, :type_url, :removed_resources, :nonce]

  field(:system_version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Envoy.Api.V2.Resource)
  field(:type_url, 4, type: :string)
  field(:removed_resources, 6, repeated: true, type: :string)
  field(:nonce, 5, type: :string)
end

defmodule Envoy.Api.V2.Resource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          aliases: [String.t()],
          version: String.t(),
          resource: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :aliases, :version, :resource]

  field(:name, 3, type: :string)
  field(:aliases, 4, repeated: true, type: :string)
  field(:version, 1, type: :string)
  field(:resource, 2, type: Google.Protobuf.Any)
end
