defmodule Envoy.Config.Filter.Network.MongoProxy.V2.MongoProxy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          stat_prefix: String.t(),
          access_log: String.t(),
          delay: Envoy.Config.Filter.Fault.V2.FaultDelay.t() | nil,
          emit_dynamic_metadata: boolean
        }
  defstruct [:stat_prefix, :access_log, :delay, :emit_dynamic_metadata]

  field(:stat_prefix, 1, type: :string)
  field(:access_log, 2, type: :string)
  field(:delay, 3, type: Envoy.Config.Filter.Fault.V2.FaultDelay)
  field(:emit_dynamic_metadata, 4, type: :bool)
end
