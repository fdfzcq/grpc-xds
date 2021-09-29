defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :STRING | :NUMBER | :PROTOBUF_VALUE

  field(:STRING, 0)
  field(:NUMBER, 1)
  field(:PROTOBUF_VALUE, 2)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueEncode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NONE | :BASE64

  field(:NONE, 0)
  field(:BASE64, 1)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          metadata_namespace: String.t(),
          key: String.t(),
          value: String.t(),
          regex_value_rewrite: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute.t() | nil,
          type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueType.t(),
          encode: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueEncode.t()
        }
  defstruct [:metadata_namespace, :key, :value, :regex_value_rewrite, :type, :encode]

  field(:metadata_namespace, 1, type: :string)
  field(:key, 2, type: :string)
  field(:value, 3, type: :string)
  field(:regex_value_rewrite, 6, type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute)

  field(:type, 4,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueType,
    enum: true
  )

  field(:encode, 5,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueEncode,
    enum: true
  )
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          header: String.t(),
          cookie: String.t(),
          on_header_present:
            Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair.t() | nil,
          on_header_missing:
            Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair.t() | nil,
          remove: boolean
        }
  defstruct [:header, :cookie, :on_header_present, :on_header_missing, :remove]

  field(:header, 1, type: :string)
  field(:cookie, 5, type: :string)

  field(:on_header_present, 2,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair
  )

  field(:on_header_missing, 3,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair
  )

  field(:remove, 4, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_rules: [Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule.t()],
          response_rules: [Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule.t()]
        }
  defstruct [:request_rules, :response_rules]

  field(:request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule
  )

  field(:response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule
  )
end
