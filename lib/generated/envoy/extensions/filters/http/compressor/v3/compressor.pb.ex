defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil,
          min_content_length: Google.Protobuf.UInt32Value.t() | nil,
          content_type: [String.t()]
        }
  defstruct [:enabled, :min_content_length, :content_type]

  field(:enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
  field(:min_content_length, 2, type: Google.Protobuf.UInt32Value)
  field(:content_type, 3, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig.t() | nil
        }
  defstruct [:common_config]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig
  )
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig.t() | nil,
          disable_on_etag_header: boolean,
          remove_accept_encoding_header: boolean
        }
  defstruct [:common_config, :disable_on_etag_header, :remove_accept_encoding_header]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.CommonDirectionConfig
  )

  field(:disable_on_etag_header, 2, type: :bool)
  field(:remove_accept_encoding_header, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V3.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          content_length: Google.Protobuf.UInt32Value.t() | nil,
          content_type: [String.t()],
          disable_on_etag_header: boolean,
          remove_accept_encoding_header: boolean,
          runtime_enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil,
          compressor_library: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil,
          request_direction_config:
            Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig.t()
            | nil,
          response_direction_config:
            Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig.t()
            | nil
        }
  defstruct [
    :content_length,
    :content_type,
    :disable_on_etag_header,
    :remove_accept_encoding_header,
    :runtime_enabled,
    :compressor_library,
    :request_direction_config,
    :response_direction_config
  ]

  field(:content_length, 1, type: Google.Protobuf.UInt32Value, deprecated: true)
  field(:content_type, 2, repeated: true, type: :string, deprecated: true)
  field(:disable_on_etag_header, 3, type: :bool, deprecated: true)
  field(:remove_accept_encoding_header, 4, type: :bool, deprecated: true)
  field(:runtime_enabled, 5, type: Envoy.Config.Core.V3.RuntimeFeatureFlag, deprecated: true)
  field(:compressor_library, 6, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:request_direction_config, 7,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.RequestDirectionConfig
  )

  field(:response_direction_config, 8,
    type: Envoy.Extensions.Filters.Http.Compressor.V3.Compressor.ResponseDirectionConfig
  )
end
