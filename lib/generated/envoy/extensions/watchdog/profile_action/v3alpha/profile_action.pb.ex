defmodule Envoy.Extensions.Watchdog.ProfileAction.V3alpha.ProfileActionConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          profile_duration: Google.Protobuf.Duration.t() | nil,
          profile_path: String.t(),
          max_profiles: non_neg_integer
        }
  defstruct [:profile_duration, :profile_path, :max_profiles]

  field(:profile_duration, 1, type: Google.Protobuf.Duration)
  field(:profile_path, 2, type: :string)
  field(:max_profiles, 3, type: :uint64)
end
