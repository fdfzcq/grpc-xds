defmodule Envoy.Type.Metadata.V2.MetadataKey.PathSegment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          segment: {atom, any}
        }
  defstruct [:segment]

  oneof(:segment, 0)
  field(:key, 1, type: :string, oneof: 0)
end

defmodule Envoy.Type.Metadata.V2.MetadataKey do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          path: [Envoy.Type.Metadata.V2.MetadataKey.PathSegment.t()]
        }
  defstruct [:key, :path]

  field(:key, 1, type: :string)
  field(:path, 2, repeated: true, type: Envoy.Type.Metadata.V2.MetadataKey.PathSegment)
end

defmodule Envoy.Type.Metadata.V2.MetadataKind.Request do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.Metadata.V2.MetadataKind.Route do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.Metadata.V2.MetadataKind.Cluster do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.Metadata.V2.MetadataKind.Host do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Type.Metadata.V2.MetadataKind do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          kind: {atom, any}
        }
  defstruct [:kind]

  oneof(:kind, 0)
  field(:request, 1, type: Envoy.Type.Metadata.V2.MetadataKind.Request, oneof: 0)
  field(:route, 2, type: Envoy.Type.Metadata.V2.MetadataKind.Route, oneof: 0)
  field(:cluster, 3, type: Envoy.Type.Metadata.V2.MetadataKind.Cluster, oneof: 0)
  field(:host, 4, type: Envoy.Type.Metadata.V2.MetadataKind.Host, oneof: 0)
end
