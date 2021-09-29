defmodule Envoy.Type.Tracing.V3.CustomTag.Literal do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          value: String.t()
        }
  defstruct [:value]

  field(:value, 1, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Environment do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          default_value: String.t()
        }
  defstruct [:name, :default_value]

  field(:name, 1, type: :string)
  field(:default_value, 2, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Header do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          default_value: String.t()
        }
  defstruct [:name, :default_value]

  field(:name, 1, type: :string)
  field(:default_value, 2, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag.Metadata do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          kind: Envoy.Type.Metadata.V3.MetadataKind.t() | nil,
          metadata_key: Envoy.Type.Metadata.V3.MetadataKey.t() | nil,
          default_value: String.t()
        }
  defstruct [:kind, :metadata_key, :default_value]

  field(:kind, 1, type: Envoy.Type.Metadata.V3.MetadataKind)
  field(:metadata_key, 2, type: Envoy.Type.Metadata.V3.MetadataKey)
  field(:default_value, 3, type: :string)
end

defmodule Envoy.Type.Tracing.V3.CustomTag do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: {atom, any},
          tag: String.t()
        }
  defstruct [:type, :tag]

  oneof(:type, 0)
  field(:tag, 1, type: :string)
  field(:literal, 2, type: Envoy.Type.Tracing.V3.CustomTag.Literal, oneof: 0)
  field(:environment, 3, type: Envoy.Type.Tracing.V3.CustomTag.Environment, oneof: 0)
  field(:request_header, 4, type: Envoy.Type.Tracing.V3.CustomTag.Header, oneof: 0)
  field(:metadata, 5, type: Envoy.Type.Tracing.V3.CustomTag.Metadata, oneof: 0)
end
