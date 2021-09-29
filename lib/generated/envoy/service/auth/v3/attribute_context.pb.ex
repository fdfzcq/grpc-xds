defmodule Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Peer do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          address: Envoy.Config.Core.V3.Address.t() | nil,
          service: String.t(),
          labels: %{String.t() => String.t()},
          principal: String.t(),
          certificate: String.t()
        }
  defstruct [:address, :service, :labels, :principal, :certificate]

  field(:address, 1, type: Envoy.Config.Core.V3.Address)
  field(:service, 2, type: :string)

  field(:labels, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry,
    map: true
  )

  field(:principal, 4, type: :string)
  field(:certificate, 5, type: :string)
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Request do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          time: Google.Protobuf.Timestamp.t() | nil,
          http: Envoy.Service.Auth.V3.AttributeContext.HttpRequest.t() | nil
        }
  defstruct [:time, :http]

  field(:time, 1, type: Google.Protobuf.Timestamp)
  field(:http, 2, type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest)
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          method: String.t(),
          headers: %{String.t() => String.t()},
          path: String.t(),
          host: String.t(),
          scheme: String.t(),
          query: String.t(),
          fragment: String.t(),
          size: integer,
          protocol: String.t(),
          body: String.t(),
          raw_body: binary
        }
  defstruct [
    :id,
    :method,
    :headers,
    :path,
    :host,
    :scheme,
    :query,
    :fragment,
    :size,
    :protocol,
    :body,
    :raw_body
  ]

  field(:id, 1, type: :string)
  field(:method, 2, type: :string)

  field(:headers, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry,
    map: true
  )

  field(:path, 4, type: :string)
  field(:host, 5, type: :string)
  field(:scheme, 6, type: :string)
  field(:query, 7, type: :string)
  field(:fragment, 8, type: :string)
  field(:size, 9, type: :int64)
  field(:protocol, 10, type: :string)
  field(:body, 11, type: :string)
  field(:raw_body, 12, type: :bytes)
end

defmodule Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: :string)
end

defmodule Envoy.Service.Auth.V3.AttributeContext do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          source: Envoy.Service.Auth.V3.AttributeContext.Peer.t() | nil,
          destination: Envoy.Service.Auth.V3.AttributeContext.Peer.t() | nil,
          request: Envoy.Service.Auth.V3.AttributeContext.Request.t() | nil,
          context_extensions: %{String.t() => String.t()},
          metadata_context: Envoy.Config.Core.V3.Metadata.t() | nil
        }
  defstruct [:source, :destination, :request, :context_extensions, :metadata_context]

  field(:source, 1, type: Envoy.Service.Auth.V3.AttributeContext.Peer)
  field(:destination, 2, type: Envoy.Service.Auth.V3.AttributeContext.Peer)
  field(:request, 4, type: Envoy.Service.Auth.V3.AttributeContext.Request)

  field(:context_extensions, 10,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry,
    map: true
  )

  field(:metadata_context, 11, type: Envoy.Config.Core.V3.Metadata)
end
