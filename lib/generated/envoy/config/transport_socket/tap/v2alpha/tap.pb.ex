defmodule Envoy.Config.TransportSocket.Tap.V2alpha.Tap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig.t() | nil,
          transport_socket: Envoy.Api.V2.Core.TransportSocket.t() | nil
        }
  defstruct [:common_config, :transport_socket]

  field(:common_config, 1, type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig)
  field(:transport_socket, 2, type: Envoy.Api.V2.Core.TransportSocket)
end
