defmodule Opencensus.Proto.Trace.V1.ConstantSampler.ConstantDecision do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t :: integer | :ALWAYS_OFF | :ALWAYS_ON | :ALWAYS_PARENT

  field(:ALWAYS_OFF, 0)
  field(:ALWAYS_ON, 1)
  field(:ALWAYS_PARENT, 2)
end

defmodule Opencensus.Proto.Trace.V1.TraceConfig do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sampler: {atom, any},
          max_number_of_attributes: integer,
          max_number_of_annotations: integer,
          max_number_of_message_events: integer,
          max_number_of_links: integer
        }
  defstruct [
    :sampler,
    :max_number_of_attributes,
    :max_number_of_annotations,
    :max_number_of_message_events,
    :max_number_of_links
  ]

  oneof(:sampler, 0)
  field(:probability_sampler, 1, type: Opencensus.Proto.Trace.V1.ProbabilitySampler, oneof: 0)
  field(:constant_sampler, 2, type: Opencensus.Proto.Trace.V1.ConstantSampler, oneof: 0)
  field(:rate_limiting_sampler, 3, type: Opencensus.Proto.Trace.V1.RateLimitingSampler, oneof: 0)
  field(:max_number_of_attributes, 4, type: :int64)
  field(:max_number_of_annotations, 5, type: :int64)
  field(:max_number_of_message_events, 6, type: :int64)
  field(:max_number_of_links, 7, type: :int64)
end

defmodule Opencensus.Proto.Trace.V1.ProbabilitySampler do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          samplingProbability: float | :infinity | :negative_infinity | :nan
        }
  defstruct [:samplingProbability]

  field(:samplingProbability, 1, type: :double)
end

defmodule Opencensus.Proto.Trace.V1.ConstantSampler do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          decision: Opencensus.Proto.Trace.V1.ConstantSampler.ConstantDecision.t()
        }
  defstruct [:decision]

  field(:decision, 1, type: Opencensus.Proto.Trace.V1.ConstantSampler.ConstantDecision, enum: true)
end

defmodule Opencensus.Proto.Trace.V1.RateLimitingSampler do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          qps: integer
        }
  defstruct [:qps]

  field(:qps, 1, type: :int64)
end
