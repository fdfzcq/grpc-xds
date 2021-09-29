defmodule Envoy.Config.Trace.V3.XRayConfig.SegmentFields do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          origin: String.t(),
          aws: Google.Protobuf.Struct.t() | nil
        }
  defstruct [:origin, :aws]

  field(:origin, 1, type: :string)
  field(:aws, 2, type: Google.Protobuf.Struct)
end

defmodule Envoy.Config.Trace.V3.XRayConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          daemon_endpoint: Envoy.Config.Core.V3.SocketAddress.t() | nil,
          segment_name: String.t(),
          sampling_rule_manifest: Envoy.Config.Core.V3.DataSource.t() | nil,
          segment_fields: Envoy.Config.Trace.V3.XRayConfig.SegmentFields.t() | nil
        }
  defstruct [:daemon_endpoint, :segment_name, :sampling_rule_manifest, :segment_fields]

  field(:daemon_endpoint, 1, type: Envoy.Config.Core.V3.SocketAddress)
  field(:segment_name, 2, type: :string)
  field(:sampling_rule_manifest, 3, type: Envoy.Config.Core.V3.DataSource)
  field(:segment_fields, 4, type: Envoy.Config.Trace.V3.XRayConfig.SegmentFields)
end
