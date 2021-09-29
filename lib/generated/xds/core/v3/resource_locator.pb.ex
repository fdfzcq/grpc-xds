defmodule Xds.Core.V3.ResourceLocator.Scheme do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :XDSTP | :HTTP | :FILE

  field(:XDSTP, 0)
  field(:HTTP, 1)
  field(:FILE, 2)
end

defmodule Xds.Core.V3.ResourceLocator.Directive do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          directive: {atom, any}
        }
  defstruct [:directive]

  oneof(:directive, 0)
  field(:alt, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0)
  field(:entry, 2, type: :string, oneof: 0)
end

defmodule Xds.Core.V3.ResourceLocator do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          context_param_specifier: {atom, any},
          scheme: Xds.Core.V3.ResourceLocator.Scheme.t(),
          id: String.t(),
          authority: String.t(),
          resource_type: String.t(),
          directives: [Xds.Core.V3.ResourceLocator.Directive.t()]
        }
  defstruct [:context_param_specifier, :scheme, :id, :authority, :resource_type, :directives]

  oneof(:context_param_specifier, 0)
  field(:scheme, 1, type: Xds.Core.V3.ResourceLocator.Scheme, enum: true)
  field(:id, 2, type: :string)
  field(:authority, 3, type: :string)
  field(:resource_type, 4, type: :string)
  field(:exact_context, 5, type: Xds.Core.V3.ContextParams, oneof: 0)
  field(:directives, 6, repeated: true, type: Xds.Core.V3.ResourceLocator.Directive)
end
