defmodule Envoy.Extensions.Filters.Http.Lua.V3.Lua.SourceCodesEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Core.V3.DataSource.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Core.V3.DataSource)
end

defmodule Envoy.Extensions.Filters.Http.Lua.V3.Lua do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          inline_code: String.t(),
          source_codes: %{String.t() => Envoy.Config.Core.V3.DataSource.t() | nil}
        }
  defstruct [:inline_code, :source_codes]

  field(:inline_code, 1, type: :string)

  field(:source_codes, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Lua.V3.Lua.SourceCodesEntry,
    map: true
  )
end

defmodule Envoy.Extensions.Filters.Http.Lua.V3.LuaPerRoute do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          override: {atom, any}
        }
  defstruct [:override]

  oneof(:override, 0)
  field(:disabled, 1, type: :bool, oneof: 0)
  field(:name, 2, type: :string, oneof: 0)
  field(:source_code, 3, type: Envoy.Config.Core.V3.DataSource, oneof: 0)
end
