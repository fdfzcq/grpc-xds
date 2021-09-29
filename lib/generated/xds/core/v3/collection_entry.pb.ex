defmodule Xds.Core.V3.CollectionEntry.InlineEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          version: String.t(),
          resource: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :version, :resource]

  field(:name, 1, type: :string)
  field(:version, 2, type: :string)
  field(:resource, 3, type: Google.Protobuf.Any)
end

defmodule Xds.Core.V3.CollectionEntry do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          resource_specifier: {atom, any}
        }
  defstruct [:resource_specifier]

  oneof(:resource_specifier, 0)
  field(:locator, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0)
  field(:inline_entry, 2, type: Xds.Core.V3.CollectionEntry.InlineEntry, oneof: 0)
end
