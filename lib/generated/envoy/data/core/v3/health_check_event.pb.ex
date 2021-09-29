defmodule Envoy.Data.Core.V3.HealthCheckFailureType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ACTIVE | :PASSIVE | :NETWORK | :NETWORK_TIMEOUT

  field(:ACTIVE, 0)
  field(:PASSIVE, 1)
  field(:NETWORK, 2)
  field(:NETWORK_TIMEOUT, 3)
end

defmodule Envoy.Data.Core.V3.HealthCheckerType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :HTTP | :TCP | :GRPC | :REDIS

  field(:HTTP, 0)
  field(:TCP, 1)
  field(:GRPC, 2)
  field(:REDIS, 3)
end

defmodule Envoy.Data.Core.V3.HealthCheckEvent do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          event: {atom, any},
          health_checker_type: Envoy.Data.Core.V3.HealthCheckerType.t(),
          host: Envoy.Config.Core.V3.Address.t() | nil,
          cluster_name: String.t(),
          timestamp: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:event, :health_checker_type, :host, :cluster_name, :timestamp]

  oneof(:event, 0)
  field(:health_checker_type, 1, type: Envoy.Data.Core.V3.HealthCheckerType, enum: true)
  field(:host, 2, type: Envoy.Config.Core.V3.Address)
  field(:cluster_name, 3, type: :string)
  field(:eject_unhealthy_event, 4, type: Envoy.Data.Core.V3.HealthCheckEjectUnhealthy, oneof: 0)
  field(:add_healthy_event, 5, type: Envoy.Data.Core.V3.HealthCheckAddHealthy, oneof: 0)
  field(:health_check_failure_event, 7, type: Envoy.Data.Core.V3.HealthCheckFailure, oneof: 0)
  field(:degraded_healthy_host, 8, type: Envoy.Data.Core.V3.DegradedHealthyHost, oneof: 0)
  field(:no_longer_degraded_host, 9, type: Envoy.Data.Core.V3.NoLongerDegradedHost, oneof: 0)
  field(:timestamp, 6, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Data.Core.V3.HealthCheckEjectUnhealthy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure_type: Envoy.Data.Core.V3.HealthCheckFailureType.t()
        }
  defstruct [:failure_type]

  field(:failure_type, 1, type: Envoy.Data.Core.V3.HealthCheckFailureType, enum: true)
end

defmodule Envoy.Data.Core.V3.HealthCheckAddHealthy do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          first_check: boolean
        }
  defstruct [:first_check]

  field(:first_check, 1, type: :bool)
end

defmodule Envoy.Data.Core.V3.HealthCheckFailure do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          failure_type: Envoy.Data.Core.V3.HealthCheckFailureType.t(),
          first_check: boolean
        }
  defstruct [:failure_type, :first_check]

  field(:failure_type, 1, type: Envoy.Data.Core.V3.HealthCheckFailureType, enum: true)
  field(:first_check, 2, type: :bool)
end

defmodule Envoy.Data.Core.V3.DegradedHealthyHost do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule Envoy.Data.Core.V3.NoLongerDegradedHost do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{}
  defstruct []
end
