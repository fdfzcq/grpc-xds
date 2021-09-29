defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled: Envoy.Config.Core.V4alpha.RuntimeFeatureFlag.t() | nil,
          min_content_length: Google.Protobuf.UInt32Value.t() | nil,
          content_type: [String.t()]
        }
  defstruct [:enabled, :min_content_length, :content_type]

  field(:enabled, 1, type: Envoy.Config.Core.V4alpha.RuntimeFeatureFlag)
  field(:min_content_length, 2, type: Google.Protobuf.UInt32Value)
  field(:content_type, 3, repeated: true, type: :string)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.RequestDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig.t()
            | nil
        }
  defstruct [:common_config]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig
  )
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.ResponseDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig.t()
            | nil,
          disable_on_etag_header: boolean,
          remove_accept_encoding_header: boolean
        }
  defstruct [:common_config, :disable_on_etag_header, :remove_accept_encoding_header]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.CommonDirectionConfig
  )

  field(:disable_on_etag_header, 2, type: :bool)
  field(:remove_accept_encoding_header, 3, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          compressor_library: Envoy.Config.Core.V4alpha.TypedExtensionConfig.t() | nil,
          request_direction_config:
            Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.RequestDirectionConfig.t()
            | nil,
          response_direction_config:
            Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.ResponseDirectionConfig.t()
            | nil
        }
  defstruct [:compressor_library, :request_direction_config, :response_direction_config]

  field(:compressor_library, 6, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)

  field(:request_direction_config, 7,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.RequestDirectionConfig
  )

  field(:response_direction_config, 8,
    type: Envoy.Extensions.Filters.Http.Compressor.V4alpha.Compressor.ResponseDirectionConfig
  )
end
