defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          on_match: {atom, any}
        }
  defstruct [:on_match]

  oneof(:on_match, 0)
  field(:matcher, 1, type: Envoy.Config.Common.Matcher.V4alpha.Matcher, oneof: 0)
  field(:action, 2, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.SinglePredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          matcher: {atom, any},
          input: Envoy.Config.Core.V4alpha.TypedExtensionConfig.t() | nil
        }
  defstruct [:matcher, :input]

  oneof(:matcher, 0)
  field(:input, 1, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)
  field(:value_match, 2, type: Envoy.Type.Matcher.V4alpha.StringMatcher, oneof: 0)
  field(:custom_match, 3, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.PredicateList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          predicate: [Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.t()]
        }
  defstruct [:predicate]

  field(:predicate, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate
  )
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          match_type: {atom, any}
        }
  defstruct [:match_type]

  oneof(:match_type, 0)

  field(:single_predicate, 1,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.SinglePredicate,
    oneof: 0
  )

  field(:or_matcher, 2,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.PredicateList,
    oneof: 0
  )

  field(:and_matcher, 3,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.PredicateList,
    oneof: 0
  )
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.FieldMatcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          predicate: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate.t() | nil,
          on_match: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch.t() | nil
        }
  defstruct [:predicate, :on_match]

  field(:predicate, 1, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.Predicate)
  field(:on_match, 2, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          matchers: [Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.FieldMatcher.t()]
        }
  defstruct [:matchers]

  field(:matchers, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList.FieldMatcher
  )
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree.MatchMap.MapEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch.t() | nil
        }
  defstruct [:key, :value]

  field(:key, 1, type: :string)
  field(:value, 2, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree.MatchMap do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          map: %{String.t() => Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch.t() | nil}
        }
  defstruct [:map]

  field(:map, 1,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree.MatchMap.MapEntry,
    map: true
  )
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tree_type: {atom, any},
          input: Envoy.Config.Core.V4alpha.TypedExtensionConfig.t() | nil
        }
  defstruct [:tree_type, :input]

  oneof(:tree_type, 0)
  field(:input, 1, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig)

  field(:exact_match_map, 2,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree.MatchMap,
    oneof: 0
  )

  field(:prefix_match_map, 3,
    type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree.MatchMap,
    oneof: 0
  )

  field(:custom_match, 4, type: Envoy.Config.Core.V4alpha.TypedExtensionConfig, oneof: 0)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.Matcher do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          matcher_type: {atom, any},
          on_no_match: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch.t() | nil
        }
  defstruct [:matcher_type, :on_no_match]

  oneof(:matcher_type, 0)
  field(:matcher_list, 1, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherList, oneof: 0)
  field(:matcher_tree, 2, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.MatcherTree, oneof: 0)
  field(:on_no_match, 3, type: Envoy.Config.Common.Matcher.V4alpha.Matcher.OnMatch)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.MatchPredicate.MatchSet do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rules: [Envoy.Config.Common.Matcher.V4alpha.MatchPredicate.t()]
        }
  defstruct [:rules]

  field(:rules, 1, repeated: true, type: Envoy.Config.Common.Matcher.V4alpha.MatchPredicate)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.MatchPredicate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:or_match, 1, type: Envoy.Config.Common.Matcher.V4alpha.MatchPredicate.MatchSet, oneof: 0)

  field(:and_match, 2, type: Envoy.Config.Common.Matcher.V4alpha.MatchPredicate.MatchSet, oneof: 0)

  field(:not_match, 3, type: Envoy.Config.Common.Matcher.V4alpha.MatchPredicate, oneof: 0)
  field(:any_match, 4, type: :bool, oneof: 0)

  field(:http_request_headers_match, 5,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_request_trailers_match, 6,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_headers_match, 7,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_response_trailers_match, 8,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpHeadersMatch,
    oneof: 0
  )

  field(:http_request_generic_body_match, 9,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch,
    oneof: 0
  )

  field(:http_response_generic_body_match, 10,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch,
    oneof: 0
  )
end

defmodule Envoy.Config.Common.Matcher.V4alpha.HttpHeadersMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          headers: [Envoy.Config.Route.V4alpha.HeaderMatcher.t()]
        }
  defstruct [:headers]

  field(:headers, 1, repeated: true, type: Envoy.Config.Route.V4alpha.HeaderMatcher)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch.GenericTextMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rule: {atom, any}
        }
  defstruct [:rule]

  oneof(:rule, 0)
  field(:string_match, 1, type: :string, oneof: 0)
  field(:binary_match, 2, type: :bytes, oneof: 0)
end

defmodule Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          bytes_limit: non_neg_integer,
          patterns: [
            Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch.GenericTextMatch.t()
          ]
        }
  defstruct [:bytes_limit, :patterns]

  field(:bytes_limit, 1, type: :uint32)

  field(:patterns, 2,
    repeated: true,
    type: Envoy.Config.Common.Matcher.V4alpha.HttpGenericBodyMatch.GenericTextMatch
  )
end
