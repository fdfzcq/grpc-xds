defmodule Envoy.Config.Core.V3.TypedExtensionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          typed_config: Google.Protobuf.Any.t() | nil
        }
  defstruct [:name, :typed_config]

  field(:name, 1, type: :string)
  field(:typed_config, 2, type: Google.Protobuf.Any)
end

defmodule Envoy.Config.Core.V3.ExtensionConfigSource do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_source: Envoy.Config.Core.V3.ConfigSource.t() | nil,
          default_config: Google.Protobuf.Any.t() | nil,
          apply_default_config_without_warming: boolean,
          type_urls: [String.t()]
        }
  defstruct [:config_source, :default_config, :apply_default_config_without_warming, :type_urls]

  field(:config_source, 1, type: Envoy.Config.Core.V3.ConfigSource)
  field(:default_config, 2, type: Google.Protobuf.Any)
  field(:apply_default_config_without_warming, 3, type: :bool)
  field(:type_urls, 4, repeated: true, type: :string)
end
