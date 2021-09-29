defmodule Envoy.Service.Discovery.V4alpha.DiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          node: Envoy.Config.Core.V4alpha.Node.t() | nil,
          resource_names: [String.t()],
          type_url: String.t(),
          response_nonce: String.t(),
          error_detail: Google.Rpc.Status.t() | nil
        }
  defstruct [:version_info, :node, :resource_names, :type_url, :response_nonce, :error_detail]

  field(:version_info, 1, type: :string)
  field(:node, 2, type: Envoy.Config.Core.V4alpha.Node)
  field(:resource_names, 3, repeated: true, type: :string)
  field(:type_url, 4, type: :string)
  field(:response_nonce, 5, type: :string)
  field(:error_detail, 6, type: Google.Rpc.Status)
end

defmodule Envoy.Service.Discovery.V4alpha.DiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version_info: String.t(),
          resources: [Google.Protobuf.Any.t()],
          canary: boolean,
          type_url: String.t(),
          nonce: String.t(),
          control_plane: Envoy.Config.Core.V4alpha.ControlPlane.t() | nil
        }
  defstruct [:version_info, :resources, :canary, :type_url, :nonce, :control_plane]

  field(:version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Google.Protobuf.Any)
  field(:canary, 3, type: :bool)
  field(:type_url, 4, type: :string)
  field(:nonce, 5, type: :string)
  field(:control_plane, 6, type: Envoy.Config.Core.V4alpha.ControlPlane)
end

defmodule Envoy.Service.Discovery.V4alpha.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
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

defmodule Envoy.Service.Discovery.V4alpha.DeltaDiscoveryRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          node: Envoy.Config.Core.V4alpha.Node.t() | nil,
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

  field(:node, 1, type: Envoy.Config.Core.V4alpha.Node)
  field(:type_url, 2, type: :string)
  field(:resource_names_subscribe, 3, repeated: true, type: :string)
  field(:resource_names_unsubscribe, 4, repeated: true, type: :string)

  field(:initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Service.Discovery.V4alpha.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    map: true
  )

  field(:response_nonce, 6, type: :string)
  field(:error_detail, 7, type: Google.Rpc.Status)
end

defmodule Envoy.Service.Discovery.V4alpha.DeltaDiscoveryResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          system_version_info: String.t(),
          resources: [Envoy.Service.Discovery.V4alpha.Resource.t()],
          type_url: String.t(),
          removed_resources: [String.t()],
          nonce: String.t(),
          control_plane: Envoy.Config.Core.V4alpha.ControlPlane.t() | nil
        }
  defstruct [
    :system_version_info,
    :resources,
    :type_url,
    :removed_resources,
    :nonce,
    :control_plane
  ]

  field(:system_version_info, 1, type: :string)
  field(:resources, 2, repeated: true, type: Envoy.Service.Discovery.V4alpha.Resource)
  field(:type_url, 4, type: :string)
  field(:removed_resources, 6, repeated: true, type: :string)
  field(:nonce, 5, type: :string)
  field(:control_plane, 7, type: Envoy.Config.Core.V4alpha.ControlPlane)
end

defmodule Envoy.Service.Discovery.V4alpha.Resource.CacheControl do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          do_not_cache: boolean
        }
  defstruct [:do_not_cache]

  field(:do_not_cache, 1, type: :bool)
end

defmodule Envoy.Service.Discovery.V4alpha.Resource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          aliases: [String.t()],
          version: String.t(),
          resource: Google.Protobuf.Any.t() | nil,
          ttl: Google.Protobuf.Duration.t() | nil,
          cache_control: Envoy.Service.Discovery.V4alpha.Resource.CacheControl.t() | nil
        }
  defstruct [:name, :aliases, :version, :resource, :ttl, :cache_control]

  field(:name, 3, type: :string)
  field(:aliases, 4, repeated: true, type: :string)
  field(:version, 1, type: :string)
  field(:resource, 2, type: Google.Protobuf.Any)
  field(:ttl, 6, type: Google.Protobuf.Duration)
  field(:cache_control, 7, type: Envoy.Service.Discovery.V4alpha.Resource.CacheControl)
end
