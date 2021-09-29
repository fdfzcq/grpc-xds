defmodule Envoy.Config.Core.V4alpha.GrpcMethodList.Service do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          method_names: [String.t()]
        }
  defstruct [:name, :method_names]

  field(:name, 1, type: :string)
  field(:method_names, 2, repeated: true, type: :string)
end

defmodule Envoy.Config.Core.V4alpha.GrpcMethodList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          services: [Envoy.Config.Core.V4alpha.GrpcMethodList.Service.t()]
        }
  defstruct [:services]

  field(:services, 1, repeated: true, type: Envoy.Config.Core.V4alpha.GrpcMethodList.Service)
end
