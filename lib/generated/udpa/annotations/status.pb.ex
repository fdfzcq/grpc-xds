defmodule Udpa.Annotations.PackageVersionStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :UNKNOWN | :FROZEN | :ACTIVE | :NEXT_MAJOR_VERSION_CANDIDATE

  field(:UNKNOWN, 0)
  field(:FROZEN, 1)
  field(:ACTIVE, 2)
  field(:NEXT_MAJOR_VERSION_CANDIDATE, 3)
end

defmodule Udpa.Annotations.StatusAnnotation do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          work_in_progress: boolean,
          package_version_status: Udpa.Annotations.PackageVersionStatus.t()
        }
  defstruct [:work_in_progress, :package_version_status]

  field(:work_in_progress, 1, type: :bool)
  field(:package_version_status, 2, type: Udpa.Annotations.PackageVersionStatus, enum: true)
end
