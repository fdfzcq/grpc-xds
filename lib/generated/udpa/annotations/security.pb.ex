defmodule Udpa.Annotations.FieldSecurityAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          configure_for_untrusted_downstream: boolean,
          configure_for_untrusted_upstream: boolean
        }
  defstruct [:configure_for_untrusted_downstream, :configure_for_untrusted_upstream]

  field(:configure_for_untrusted_downstream, 1, type: :bool)
  field(:configure_for_untrusted_upstream, 2, type: :bool)
end
