defmodule Envoy.Config.Core.V4alpha.SubstitutionFormatString do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          format: {atom, any},
          omit_empty_values: boolean,
          content_type: String.t(),
          formatters: [Envoy.Config.Core.V4alpha.TypedExtensionConfig.t()]
        }
  defstruct [:format, :omit_empty_values, :content_type, :formatters]

  oneof(:format, 0)
  field(:json_format, 2, type: Google.Protobuf.Struct, oneof: 0)
  field(:text_format_source, 5, type: Envoy.Config.Core.V4alpha.DataSource, oneof: 0)
  field(:omit_empty_values, 3, type: :bool)
  field(:content_type, 4, type: :string)
  field(:formatters, 6, repeated: true, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
end
