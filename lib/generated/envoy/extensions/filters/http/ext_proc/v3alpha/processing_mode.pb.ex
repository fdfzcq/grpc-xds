defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :DEFAULT | :SEND | :SKIP

  field(:DEFAULT, 0)
  field(:SEND, 1)
  field(:SKIP, 2)
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.BodySendMode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :NONE | :STREAMED | :BUFFERED | :BUFFERED_PARTIAL

  field(:NONE, 0)
  field(:STREAMED, 1)
  field(:BUFFERED, 2)
  field(:BUFFERED_PARTIAL, 3)
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          request_header_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode.t(),
          response_header_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode.t(),
          request_body_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.BodySendMode.t(),
          response_body_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.BodySendMode.t(),
          request_trailer_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode.t(),
          response_trailer_mode:
            Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode.t()
        }
  defstruct [
    :request_header_mode,
    :response_header_mode,
    :request_body_mode,
    :response_body_mode,
    :request_trailer_mode,
    :response_trailer_mode
  ]

  field(:request_header_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode,
    enum: true
  )

  field(:response_header_mode, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode,
    enum: true
  )

  field(:request_body_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.BodySendMode,
    enum: true
  )

  field(:response_body_mode, 4,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.BodySendMode,
    enum: true
  )

  field(:request_trailer_mode, 5,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode,
    enum: true
  )

  field(:response_trailer_mode, 6,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3alpha.ProcessingMode.HeaderSendMode,
    enum: true
  )
end
