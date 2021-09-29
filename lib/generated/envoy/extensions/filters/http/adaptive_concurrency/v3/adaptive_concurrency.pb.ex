defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.ConcurrencyLimitCalculationParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          max_concurrency_limit: Google.Protobuf.UInt32Value.t() | nil,
          concurrency_update_interval: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:max_concurrency_limit, :concurrency_update_interval]

  field(:max_concurrency_limit, 2, type: Google.Protobuf.UInt32Value)
  field(:concurrency_update_interval, 3, type: Google.Protobuf.Duration)
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.MinimumRTTCalculationParams do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          interval: Google.Protobuf.Duration.t() | nil,
          request_count: Google.Protobuf.UInt32Value.t() | nil,
          jitter: Envoy.Type.V3.Percent.t() | nil,
          min_concurrency: Google.Protobuf.UInt32Value.t() | nil,
          buffer: Envoy.Type.V3.Percent.t() | nil
        }
  defstruct [:interval, :request_count, :jitter, :min_concurrency, :buffer]

  field(:interval, 1, type: Google.Protobuf.Duration)
  field(:request_count, 2, type: Google.Protobuf.UInt32Value)
  field(:jitter, 3, type: Envoy.Type.V3.Percent)
  field(:min_concurrency, 4, type: Google.Protobuf.UInt32Value)
  field(:buffer, 5, type: Envoy.Type.V3.Percent)
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sample_aggregate_percentile: Envoy.Type.V3.Percent.t() | nil,
          concurrency_limit_params:
            Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.ConcurrencyLimitCalculationParams.t()
            | nil,
          min_rtt_calc_params:
            Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.MinimumRTTCalculationParams.t()
            | nil
        }
  defstruct [:sample_aggregate_percentile, :concurrency_limit_params, :min_rtt_calc_params]

  field(:sample_aggregate_percentile, 1, type: Envoy.Type.V3.Percent)

  field(:concurrency_limit_params, 2,
    type:
      Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.ConcurrencyLimitCalculationParams
  )

  field(:min_rtt_calc_params, 3,
    type:
      Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.MinimumRTTCalculationParams
  )
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.AdaptiveConcurrency do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          concurrency_controller_config: {atom, any},
          enabled: Envoy.Config.Core.V3.RuntimeFeatureFlag.t() | nil
        }
  defstruct [:concurrency_controller_config, :enabled]

  oneof(:concurrency_controller_config, 0)

  field(:gradient_controller_config, 1,
    type: Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig,
    oneof: 0
  )

  field(:enabled, 2, type: Envoy.Config.Core.V3.RuntimeFeatureFlag)
end
