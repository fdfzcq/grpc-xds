defmodule Xds.Core.V3.ContextParams.ParamsEntry do
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

defmodule Xds.Core.V3.ContextParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          params: %{String.t() => String.t()}
        }
  defstruct [:params]

  field(:params, 1, repeated: true, type: Xds.Core.V3.ContextParams.ParamsEntry, map: true)
end
