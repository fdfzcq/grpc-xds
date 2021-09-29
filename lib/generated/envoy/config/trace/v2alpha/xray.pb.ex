defmodule Envoy.Config.Trace.V2alpha.XRayConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          daemon_endpoint: Envoy.Api.V2.Core.SocketAddress.t() | nil,
          segment_name: String.t(),
          sampling_rule_manifest: Envoy.Api.V2.Core.DataSource.t() | nil
        }
  defstruct [:daemon_endpoint, :segment_name, :sampling_rule_manifest]

  field(:daemon_endpoint, 1, type: Envoy.Api.V2.Core.SocketAddress)
  field(:segment_name, 2, type: :string)
  field(:sampling_rule_manifest, 3, type: Envoy.Api.V2.Core.DataSource)
end
