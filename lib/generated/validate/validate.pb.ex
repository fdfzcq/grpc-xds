defmodule Validate.KnownRegex do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :UNKNOWN | :HTTP_HEADER_NAME | :HTTP_HEADER_VALUE

  field(:UNKNOWN, 0)
  field(:HTTP_HEADER_NAME, 1)
  field(:HTTP_HEADER_VALUE, 2)
end

defmodule Validate.FieldRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: {atom, any},
          message: Validate.MessageRules.t() | nil
        }
  defstruct [:type, :message]

  oneof(:type, 0)
  field(:message, 17, optional: true, type: Validate.MessageRules)
  field(:float, 1, optional: true, type: Validate.FloatRules, oneof: 0)
  field(:double, 2, optional: true, type: Validate.DoubleRules, oneof: 0)
  field(:int32, 3, optional: true, type: Validate.Int32Rules, oneof: 0)
  field(:int64, 4, optional: true, type: Validate.Int64Rules, oneof: 0)
  field(:uint32, 5, optional: true, type: Validate.UInt32Rules, oneof: 0)
  field(:uint64, 6, optional: true, type: Validate.UInt64Rules, oneof: 0)
  field(:sint32, 7, optional: true, type: Validate.SInt32Rules, oneof: 0)
  field(:sint64, 8, optional: true, type: Validate.SInt64Rules, oneof: 0)
  field(:fixed32, 9, optional: true, type: Validate.Fixed32Rules, oneof: 0)
  field(:fixed64, 10, optional: true, type: Validate.Fixed64Rules, oneof: 0)
  field(:sfixed32, 11, optional: true, type: Validate.SFixed32Rules, oneof: 0)
  field(:sfixed64, 12, optional: true, type: Validate.SFixed64Rules, oneof: 0)
  field(:bool, 13, optional: true, type: Validate.BoolRules, oneof: 0)
  field(:string, 14, optional: true, type: Validate.StringRules, oneof: 0)
  field(:bytes, 15, optional: true, type: Validate.BytesRules, oneof: 0)
  field(:enum, 16, optional: true, type: Validate.EnumRules, oneof: 0)
  field(:repeated, 18, optional: true, type: Validate.RepeatedRules, oneof: 0)
  field(:map, 19, optional: true, type: Validate.MapRules, oneof: 0)
  field(:any, 20, optional: true, type: Validate.AnyRules, oneof: 0)
  field(:duration, 21, optional: true, type: Validate.DurationRules, oneof: 0)
  field(:timestamp, 22, optional: true, type: Validate.TimestampRules, oneof: 0)
end

defmodule Validate.FloatRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: float | :infinity | :negative_infinity | :nan,
          lt: float | :infinity | :negative_infinity | :nan,
          lte: float | :infinity | :negative_infinity | :nan,
          gt: float | :infinity | :negative_infinity | :nan,
          gte: float | :infinity | :negative_infinity | :nan,
          in: [float | :infinity | :negative_infinity | :nan],
          not_in: [float | :infinity | :negative_infinity | :nan]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :float)
  field(:lt, 2, optional: true, type: :float)
  field(:lte, 3, optional: true, type: :float)
  field(:gt, 4, optional: true, type: :float)
  field(:gte, 5, optional: true, type: :float)
  field(:in, 6, repeated: true, type: :float)
  field(:not_in, 7, repeated: true, type: :float)
end

defmodule Validate.DoubleRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: float | :infinity | :negative_infinity | :nan,
          lt: float | :infinity | :negative_infinity | :nan,
          lte: float | :infinity | :negative_infinity | :nan,
          gt: float | :infinity | :negative_infinity | :nan,
          gte: float | :infinity | :negative_infinity | :nan,
          in: [float | :infinity | :negative_infinity | :nan],
          not_in: [float | :infinity | :negative_infinity | :nan]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :double)
  field(:lt, 2, optional: true, type: :double)
  field(:lte, 3, optional: true, type: :double)
  field(:gt, 4, optional: true, type: :double)
  field(:gte, 5, optional: true, type: :double)
  field(:in, 6, repeated: true, type: :double)
  field(:not_in, 7, repeated: true, type: :double)
end

defmodule Validate.Int32Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :int32)
  field(:lt, 2, optional: true, type: :int32)
  field(:lte, 3, optional: true, type: :int32)
  field(:gt, 4, optional: true, type: :int32)
  field(:gte, 5, optional: true, type: :int32)
  field(:in, 6, repeated: true, type: :int32)
  field(:not_in, 7, repeated: true, type: :int32)
end

defmodule Validate.Int64Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :int64)
  field(:lt, 2, optional: true, type: :int64)
  field(:lte, 3, optional: true, type: :int64)
  field(:gt, 4, optional: true, type: :int64)
  field(:gte, 5, optional: true, type: :int64)
  field(:in, 6, repeated: true, type: :int64)
  field(:not_in, 7, repeated: true, type: :int64)
end

defmodule Validate.UInt32Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: non_neg_integer,
          lt: non_neg_integer,
          lte: non_neg_integer,
          gt: non_neg_integer,
          gte: non_neg_integer,
          in: [non_neg_integer],
          not_in: [non_neg_integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :uint32)
  field(:lt, 2, optional: true, type: :uint32)
  field(:lte, 3, optional: true, type: :uint32)
  field(:gt, 4, optional: true, type: :uint32)
  field(:gte, 5, optional: true, type: :uint32)
  field(:in, 6, repeated: true, type: :uint32)
  field(:not_in, 7, repeated: true, type: :uint32)
end

defmodule Validate.UInt64Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: non_neg_integer,
          lt: non_neg_integer,
          lte: non_neg_integer,
          gt: non_neg_integer,
          gte: non_neg_integer,
          in: [non_neg_integer],
          not_in: [non_neg_integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :uint64)
  field(:lt, 2, optional: true, type: :uint64)
  field(:lte, 3, optional: true, type: :uint64)
  field(:gt, 4, optional: true, type: :uint64)
  field(:gte, 5, optional: true, type: :uint64)
  field(:in, 6, repeated: true, type: :uint64)
  field(:not_in, 7, repeated: true, type: :uint64)
end

defmodule Validate.SInt32Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :sint32)
  field(:lt, 2, optional: true, type: :sint32)
  field(:lte, 3, optional: true, type: :sint32)
  field(:gt, 4, optional: true, type: :sint32)
  field(:gte, 5, optional: true, type: :sint32)
  field(:in, 6, repeated: true, type: :sint32)
  field(:not_in, 7, repeated: true, type: :sint32)
end

defmodule Validate.SInt64Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :sint64)
  field(:lt, 2, optional: true, type: :sint64)
  field(:lte, 3, optional: true, type: :sint64)
  field(:gt, 4, optional: true, type: :sint64)
  field(:gte, 5, optional: true, type: :sint64)
  field(:in, 6, repeated: true, type: :sint64)
  field(:not_in, 7, repeated: true, type: :sint64)
end

defmodule Validate.Fixed32Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: non_neg_integer,
          lt: non_neg_integer,
          lte: non_neg_integer,
          gt: non_neg_integer,
          gte: non_neg_integer,
          in: [non_neg_integer],
          not_in: [non_neg_integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :fixed32)
  field(:lt, 2, optional: true, type: :fixed32)
  field(:lte, 3, optional: true, type: :fixed32)
  field(:gt, 4, optional: true, type: :fixed32)
  field(:gte, 5, optional: true, type: :fixed32)
  field(:in, 6, repeated: true, type: :fixed32)
  field(:not_in, 7, repeated: true, type: :fixed32)
end

defmodule Validate.Fixed64Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: non_neg_integer,
          lt: non_neg_integer,
          lte: non_neg_integer,
          gt: non_neg_integer,
          gte: non_neg_integer,
          in: [non_neg_integer],
          not_in: [non_neg_integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :fixed64)
  field(:lt, 2, optional: true, type: :fixed64)
  field(:lte, 3, optional: true, type: :fixed64)
  field(:gt, 4, optional: true, type: :fixed64)
  field(:gte, 5, optional: true, type: :fixed64)
  field(:in, 6, repeated: true, type: :fixed64)
  field(:not_in, 7, repeated: true, type: :fixed64)
end

defmodule Validate.SFixed32Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :sfixed32)
  field(:lt, 2, optional: true, type: :sfixed32)
  field(:lte, 3, optional: true, type: :sfixed32)
  field(:gt, 4, optional: true, type: :sfixed32)
  field(:gte, 5, optional: true, type: :sfixed32)
  field(:in, 6, repeated: true, type: :sfixed32)
  field(:not_in, 7, repeated: true, type: :sfixed32)
end

defmodule Validate.SFixed64Rules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          lt: integer,
          lte: integer,
          gt: integer,
          gte: integer,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:const, 1, optional: true, type: :sfixed64)
  field(:lt, 2, optional: true, type: :sfixed64)
  field(:lte, 3, optional: true, type: :sfixed64)
  field(:gt, 4, optional: true, type: :sfixed64)
  field(:gte, 5, optional: true, type: :sfixed64)
  field(:in, 6, repeated: true, type: :sfixed64)
  field(:not_in, 7, repeated: true, type: :sfixed64)
end

defmodule Validate.BoolRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: boolean
        }
  defstruct [:const]

  field(:const, 1, optional: true, type: :bool)
end

defmodule Validate.StringRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          well_known: {atom, any},
          const: String.t(),
          len: non_neg_integer,
          min_len: non_neg_integer,
          max_len: non_neg_integer,
          len_bytes: non_neg_integer,
          min_bytes: non_neg_integer,
          max_bytes: non_neg_integer,
          pattern: String.t(),
          prefix: String.t(),
          suffix: String.t(),
          contains: String.t(),
          not_contains: String.t(),
          in: [String.t()],
          not_in: [String.t()],
          strict: boolean
        }
  defstruct [
    :well_known,
    :const,
    :len,
    :min_len,
    :max_len,
    :len_bytes,
    :min_bytes,
    :max_bytes,
    :pattern,
    :prefix,
    :suffix,
    :contains,
    :not_contains,
    :in,
    :not_in,
    :strict
  ]

  oneof(:well_known, 0)
  field(:const, 1, optional: true, type: :string)
  field(:len, 19, optional: true, type: :uint64)
  field(:min_len, 2, optional: true, type: :uint64)
  field(:max_len, 3, optional: true, type: :uint64)
  field(:len_bytes, 20, optional: true, type: :uint64)
  field(:min_bytes, 4, optional: true, type: :uint64)
  field(:max_bytes, 5, optional: true, type: :uint64)
  field(:pattern, 6, optional: true, type: :string)
  field(:prefix, 7, optional: true, type: :string)
  field(:suffix, 8, optional: true, type: :string)
  field(:contains, 9, optional: true, type: :string)
  field(:not_contains, 23, optional: true, type: :string)
  field(:in, 10, repeated: true, type: :string)
  field(:not_in, 11, repeated: true, type: :string)
  field(:email, 12, optional: true, type: :bool, oneof: 0)
  field(:hostname, 13, optional: true, type: :bool, oneof: 0)
  field(:ip, 14, optional: true, type: :bool, oneof: 0)
  field(:ipv4, 15, optional: true, type: :bool, oneof: 0)
  field(:ipv6, 16, optional: true, type: :bool, oneof: 0)
  field(:uri, 17, optional: true, type: :bool, oneof: 0)
  field(:uri_ref, 18, optional: true, type: :bool, oneof: 0)
  field(:address, 21, optional: true, type: :bool, oneof: 0)
  field(:uuid, 22, optional: true, type: :bool, oneof: 0)
  field(:well_known_regex, 24, optional: true, type: Validate.KnownRegex, enum: true, oneof: 0)
  field(:strict, 25, optional: true, type: :bool, default: true)
end

defmodule Validate.BytesRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          well_known: {atom, any},
          const: binary,
          len: non_neg_integer,
          min_len: non_neg_integer,
          max_len: non_neg_integer,
          pattern: String.t(),
          prefix: binary,
          suffix: binary,
          contains: binary,
          in: [binary],
          not_in: [binary]
        }
  defstruct [
    :well_known,
    :const,
    :len,
    :min_len,
    :max_len,
    :pattern,
    :prefix,
    :suffix,
    :contains,
    :in,
    :not_in
  ]

  oneof(:well_known, 0)
  field(:const, 1, optional: true, type: :bytes)
  field(:len, 13, optional: true, type: :uint64)
  field(:min_len, 2, optional: true, type: :uint64)
  field(:max_len, 3, optional: true, type: :uint64)
  field(:pattern, 4, optional: true, type: :string)
  field(:prefix, 5, optional: true, type: :bytes)
  field(:suffix, 6, optional: true, type: :bytes)
  field(:contains, 7, optional: true, type: :bytes)
  field(:in, 8, repeated: true, type: :bytes)
  field(:not_in, 9, repeated: true, type: :bytes)
  field(:ip, 10, optional: true, type: :bool, oneof: 0)
  field(:ipv4, 11, optional: true, type: :bool, oneof: 0)
  field(:ipv6, 12, optional: true, type: :bool, oneof: 0)
end

defmodule Validate.EnumRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          const: integer,
          defined_only: boolean,
          in: [integer],
          not_in: [integer]
        }
  defstruct [:const, :defined_only, :in, :not_in]

  field(:const, 1, optional: true, type: :int32)
  field(:defined_only, 2, optional: true, type: :bool)
  field(:in, 3, repeated: true, type: :int32)
  field(:not_in, 4, repeated: true, type: :int32)
end

defmodule Validate.MessageRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          skip: boolean,
          required: boolean
        }
  defstruct [:skip, :required]

  field(:skip, 1, optional: true, type: :bool)
  field(:required, 2, optional: true, type: :bool)
end

defmodule Validate.RepeatedRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min_items: non_neg_integer,
          max_items: non_neg_integer,
          unique: boolean,
          items: Validate.FieldRules.t() | nil
        }
  defstruct [:min_items, :max_items, :unique, :items]

  field(:min_items, 1, optional: true, type: :uint64)
  field(:max_items, 2, optional: true, type: :uint64)
  field(:unique, 3, optional: true, type: :bool)
  field(:items, 4, optional: true, type: Validate.FieldRules)
end

defmodule Validate.MapRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min_pairs: non_neg_integer,
          max_pairs: non_neg_integer,
          no_sparse: boolean,
          keys: Validate.FieldRules.t() | nil,
          values: Validate.FieldRules.t() | nil
        }
  defstruct [:min_pairs, :max_pairs, :no_sparse, :keys, :values]

  field(:min_pairs, 1, optional: true, type: :uint64)
  field(:max_pairs, 2, optional: true, type: :uint64)
  field(:no_sparse, 3, optional: true, type: :bool)
  field(:keys, 4, optional: true, type: Validate.FieldRules)
  field(:values, 5, optional: true, type: Validate.FieldRules)
end

defmodule Validate.AnyRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          required: boolean,
          in: [String.t()],
          not_in: [String.t()]
        }
  defstruct [:required, :in, :not_in]

  field(:required, 1, optional: true, type: :bool)
  field(:in, 2, repeated: true, type: :string)
  field(:not_in, 3, repeated: true, type: :string)
end

defmodule Validate.DurationRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          required: boolean,
          const: Google.Protobuf.Duration.t() | nil,
          lt: Google.Protobuf.Duration.t() | nil,
          lte: Google.Protobuf.Duration.t() | nil,
          gt: Google.Protobuf.Duration.t() | nil,
          gte: Google.Protobuf.Duration.t() | nil,
          in: [Google.Protobuf.Duration.t()],
          not_in: [Google.Protobuf.Duration.t()]
        }
  defstruct [:required, :const, :lt, :lte, :gt, :gte, :in, :not_in]

  field(:required, 1, optional: true, type: :bool)
  field(:const, 2, optional: true, type: Google.Protobuf.Duration)
  field(:lt, 3, optional: true, type: Google.Protobuf.Duration)
  field(:lte, 4, optional: true, type: Google.Protobuf.Duration)
  field(:gt, 5, optional: true, type: Google.Protobuf.Duration)
  field(:gte, 6, optional: true, type: Google.Protobuf.Duration)
  field(:in, 7, repeated: true, type: Google.Protobuf.Duration)
  field(:not_in, 8, repeated: true, type: Google.Protobuf.Duration)
end

defmodule Validate.TimestampRules do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          required: boolean,
          const: Google.Protobuf.Timestamp.t() | nil,
          lt: Google.Protobuf.Timestamp.t() | nil,
          lte: Google.Protobuf.Timestamp.t() | nil,
          gt: Google.Protobuf.Timestamp.t() | nil,
          gte: Google.Protobuf.Timestamp.t() | nil,
          lt_now: boolean,
          gt_now: boolean,
          within: Google.Protobuf.Duration.t() | nil
        }
  defstruct [:required, :const, :lt, :lte, :gt, :gte, :lt_now, :gt_now, :within]

  field(:required, 1, optional: true, type: :bool)
  field(:const, 2, optional: true, type: Google.Protobuf.Timestamp)
  field(:lt, 3, optional: true, type: Google.Protobuf.Timestamp)
  field(:lte, 4, optional: true, type: Google.Protobuf.Timestamp)
  field(:gt, 5, optional: true, type: Google.Protobuf.Timestamp)
  field(:gte, 6, optional: true, type: Google.Protobuf.Timestamp)
  field(:lt_now, 7, optional: true, type: :bool)
  field(:gt_now, 8, optional: true, type: :bool)
  field(:within, 9, optional: true, type: Google.Protobuf.Duration)
end
