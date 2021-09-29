defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil
        }
  defstruct [:enabled]

  field(:enabled, 1, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.RequestDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig.t()
            | nil,
          advertise_accept_encoding: Google.Protobuf.BoolValue.t() | nil
        }
  defstruct [:common_config, :advertise_accept_encoding]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig
  )

  field(:advertise_accept_encoding, 2, type: Google.Protobuf.BoolValue)
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.ResponseDirectionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          common_config:
            Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig.t()
            | nil
        }
  defstruct [:common_config]

  field(:common_config, 1,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.CommonDirectionConfig
  )
end

defmodule Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          decompressor_library: Envoy.Config.Core.V3.TypedExtensionConfig.t() | nil,
          request_direction_config:
            Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.RequestDirectionConfig.t()
            | nil,
          response_direction_config:
            Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.ResponseDirectionConfig.t()
            | nil
        }
  defstruct [:decompressor_library, :request_direction_config, :response_direction_config]

  field(:decompressor_library, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig)

  field(:request_direction_config, 2,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.RequestDirectionConfig
  )

  field(:response_direction_config, 3,
    type: Envoy.Extensions.Filters.Http.Decompressor.V3.Decompressor.ResponseDirectionConfig
  )
end
