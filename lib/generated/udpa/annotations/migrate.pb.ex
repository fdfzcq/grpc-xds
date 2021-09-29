defmodule Udpa.Annotations.MigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rename: String.t()
        }
  defstruct [:rename]

  field(:rename, 1, type: :string)
end

defmodule Udpa.Annotations.FieldMigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rename: String.t(),
          oneof_promotion: String.t()
        }
  defstruct [:rename, :oneof_promotion]

  field(:rename, 1, type: :string)
  field(:oneof_promotion, 2, type: :string)
end

defmodule Udpa.Annotations.FileMigrateAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          move_to_package: String.t()
        }
  defstruct [:move_to_package]

  field(:move_to_package, 2, type: :string)
end
