defmodule Envoy.Admin.V4alpha.UnreadyTargetsDumps.UnreadyTargetsDump do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          target_names: [String.t()]
        }
  defstruct [:name, :target_names]

  field(:name, 1, type: :string)
  field(:target_names, 2, repeated: true, type: :string)
end

defmodule Envoy.Admin.V4alpha.UnreadyTargetsDumps do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          unready_targets_dumps: [Envoy.Admin.V4alpha.UnreadyTargetsDumps.UnreadyTargetsDump.t()]
        }
  defstruct [:unready_targets_dumps]

  field(:unready_targets_dumps, 1,
    repeated: true,
    type: Envoy.Admin.V4alpha.UnreadyTargetsDumps.UnreadyTargetsDump
  )
end
