defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.UrlUnescapeSpec do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :ALL_CHARACTERS_EXCEPT_RESERVED
          | :ALL_CHARACTERS_EXCEPT_SLASH
          | :ALL_CHARACTERS

  field(:ALL_CHARACTERS_EXCEPT_RESERVED, 0)
  field(:ALL_CHARACTERS_EXCEPT_SLASH, 1)
  field(:ALL_CHARACTERS, 2)
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.PrintOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          add_whitespace: boolean,
          always_print_primitive_fields: boolean,
          always_print_enums_as_ints: boolean,
          preserve_proto_field_names: boolean
        }
  defstruct [
    :add_whitespace,
    :always_print_primitive_fields,
    :always_print_enums_as_ints,
    :preserve_proto_field_names
  ]

  field(:add_whitespace, 1, type: :bool)
  field(:always_print_primitive_fields, 2, type: :bool)
  field(:always_print_enums_as_ints, 3, type: :bool)
  field(:preserve_proto_field_names, 4, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.RequestValidationOptions do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          reject_unknown_method: boolean,
          reject_unknown_query_parameters: boolean
        }
  defstruct [:reject_unknown_method, :reject_unknown_query_parameters]

  field(:reject_unknown_method, 1, type: :bool)
  field(:reject_unknown_query_parameters, 2, type: :bool)
end

defmodule Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          descriptor_set: {atom, any},
          services: [String.t()],
          print_options:
            Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.PrintOptions.t()
            | nil,
          match_incoming_request_route: boolean,
          ignored_query_parameters: [String.t()],
          auto_mapping: boolean,
          ignore_unknown_query_parameters: boolean,
          convert_grpc_status: boolean,
          url_unescape_spec:
            Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.UrlUnescapeSpec.t(),
          request_validation_options:
            Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.RequestValidationOptions.t()
            | nil
        }
  defstruct [
    :descriptor_set,
    :services,
    :print_options,
    :match_incoming_request_route,
    :ignored_query_parameters,
    :auto_mapping,
    :ignore_unknown_query_parameters,
    :convert_grpc_status,
    :url_unescape_spec,
    :request_validation_options
  ]

  oneof(:descriptor_set, 0)
  field(:proto_descriptor, 1, type: :string, oneof: 0)
  field(:proto_descriptor_bin, 4, type: :bytes, oneof: 0)
  field(:services, 2, repeated: true, type: :string)

  field(:print_options, 3,
    type: Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.PrintOptions
  )

  field(:match_incoming_request_route, 5, type: :bool)
  field(:ignored_query_parameters, 6, repeated: true, type: :string)
  field(:auto_mapping, 7, type: :bool)
  field(:ignore_unknown_query_parameters, 8, type: :bool)
  field(:convert_grpc_status, 9, type: :bool)

  field(:url_unescape_spec, 10,
    type: Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.UrlUnescapeSpec,
    enum: true
  )

  field(:request_validation_options, 11,
    type:
      Envoy.Extensions.Filters.Http.GrpcJsonTranscoder.V3.GrpcJsonTranscoder.RequestValidationOptions
  )
end
