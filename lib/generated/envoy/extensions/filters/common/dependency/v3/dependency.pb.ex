defmodule Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.DependencyType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :HEADER | :FILTER_STATE_KEY | :DYNAMIC_METADATA

  field(:HEADER, 0)
  field(:FILTER_STATE_KEY, 1)
  field(:DYNAMIC_METADATA, 2)
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.Dependency do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.DependencyType.t(),
          name: String.t()
        }
  defstruct [:type, :name]

  field(:type, 1,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.DependencyType,
    enum: true
  )

  field(:name, 2, type: :string)
end

defmodule Envoy.Extensions.Filters.Common.Dependency.V3.FilterDependencies do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          decode_required: [Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.t()],
          decode_provided: [Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.t()],
          encode_required: [Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.t()],
          encode_provided: [Envoy.Extensions.Filters.Common.Dependency.V3.Dependency.t()]
        }
  defstruct [:decode_required, :decode_provided, :encode_required, :encode_provided]

  field(:decode_required, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency
  )

  field(:decode_provided, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency
  )

  field(:encode_required, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency
  )

  field(:encode_provided, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.Dependency.V3.Dependency
  )
end
