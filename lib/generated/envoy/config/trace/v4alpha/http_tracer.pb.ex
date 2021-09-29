defmodule Envoy.Config.Trace.V4alpha.Tracing.Http do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          config_type: {atom, any},
          name: String.t()
        }
  defstruct [:config_type, :name]

  oneof(:config_type, 0)
  field(:name, 1, type: :string)
  field(:typed_config, 3, type: Google.Protobuf.Any, oneof: 0)
end

defmodule Envoy.Config.Trace.V4alpha.Tracing do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http: Envoy.Config.Trace.V4alpha.Tracing.Http.t() | nil
        }
  defstruct [:http]

  field(:http, 1, type: Envoy.Config.Trace.V4alpha.Tracing.Http)
end
