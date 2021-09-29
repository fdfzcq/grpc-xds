defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          protocol_config: {atom, any}
        }
  defstruct [:protocol_config]

  oneof(:protocol_config, 0)
  field(:http_protocol_options, 1, type: Envoy.Config.Core.V3.Http1ProtocolOptions, oneof: 0)
  field(:http2_protocol_options, 2, type: Envoy.Config.Core.V3.Http2ProtocolOptions, oneof: 0)
  field(:http3_protocol_options, 3, type: Envoy.Config.Core.V3.Http3ProtocolOptions, oneof: 0)
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_protocol_options: Envoy.Config.Core.V3.Http1ProtocolOptions.t() | nil,
          http2_protocol_options: Envoy.Config.Core.V3.Http2ProtocolOptions.t() | nil,
          http3_protocol_options: Envoy.Config.Core.V3.Http3ProtocolOptions.t() | nil
        }
  defstruct [:http_protocol_options, :http2_protocol_options, :http3_protocol_options]

  field(:http_protocol_options, 1, type: Envoy.Config.Core.V3.Http1ProtocolOptions)
  field(:http2_protocol_options, 2, type: Envoy.Config.Core.V3.Http2ProtocolOptions)
  field(:http3_protocol_options, 3, type: Envoy.Config.Core.V3.Http3ProtocolOptions)
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          http_protocol_options: Envoy.Config.Core.V3.Http1ProtocolOptions.t() | nil,
          http2_protocol_options: Envoy.Config.Core.V3.Http2ProtocolOptions.t() | nil
        }
  defstruct [:http_protocol_options, :http2_protocol_options]

  field(:http_protocol_options, 1, type: Envoy.Config.Core.V3.Http1ProtocolOptions)
  field(:http2_protocol_options, 2, type: Envoy.Config.Core.V3.Http2ProtocolOptions)
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          upstream_protocol_options: {atom, any},
          common_http_protocol_options: Envoy.Config.Core.V3.HttpProtocolOptions.t() | nil,
          upstream_http_protocol_options:
            Envoy.Config.Core.V3.UpstreamHttpProtocolOptions.t() | nil
        }
  defstruct [
    :upstream_protocol_options,
    :common_http_protocol_options,
    :upstream_http_protocol_options
  ]

  oneof(:upstream_protocol_options, 0)
  field(:common_http_protocol_options, 1, type: Envoy.Config.Core.V3.HttpProtocolOptions)

  field(:upstream_http_protocol_options, 2, type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions)

  field(:explicit_http_config, 3,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig,
    oneof: 0
  )

  field(:use_downstream_protocol_config, 4,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig,
    oneof: 0
  )

  field(:auto_config, 5,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig,
    oneof: 0
  )
end
