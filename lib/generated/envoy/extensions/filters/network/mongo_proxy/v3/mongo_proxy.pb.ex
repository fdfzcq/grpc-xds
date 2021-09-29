defmodule Envoy.Extensions.Filters.Network.MongoProxy.V3.MongoProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          access_log: String.t(),
          delay: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay.t() | nil,
          emit_dynamic_metadata: boolean,
          commands: [String.t()]
        }
  defstruct [:stat_prefix, :access_log, :delay, :emit_dynamic_metadata, :commands]

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
  field(:delay, 3, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay)
  field(:emit_dynamic_metadata, 4, type: :bool)
  field(:commands, 5, repeated: true, type: :string)
end
