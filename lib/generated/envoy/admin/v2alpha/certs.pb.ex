defmodule Envoy.Admin.V2alpha.Certificates do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          certificates: [Envoy.Admin.V2alpha.Certificate.t()]
        }
  defstruct [:certificates]

  field(:certificates, 1, repeated: true, type: Envoy.Admin.V2alpha.Certificate)
end

defmodule Envoy.Admin.V2alpha.Certificate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ca_cert: [Envoy.Admin.V2alpha.CertificateDetails.t()],
          cert_chain: [Envoy.Admin.V2alpha.CertificateDetails.t()]
        }
  defstruct [:ca_cert, :cert_chain]

  field(:ca_cert, 1, repeated: true, type: Envoy.Admin.V2alpha.CertificateDetails)
  field(:cert_chain, 2, repeated: true, type: Envoy.Admin.V2alpha.CertificateDetails)
end

defmodule Envoy.Admin.V2alpha.CertificateDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path: String.t(),
          serial_number: String.t(),
          subject_alt_names: [Envoy.Admin.V2alpha.SubjectAlternateName.t()],
          days_until_expiration: non_neg_integer,
          valid_from: Google.Protobuf.Timestamp.t() | nil,
          expiration_time: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [
    :path,
    :serial_number,
    :subject_alt_names,
    :days_until_expiration,
    :valid_from,
    :expiration_time
  ]

  field(:path, 1, type: :string)
  field(:serial_number, 2, type: :string)
  field(:subject_alt_names, 3, repeated: true, type: Envoy.Admin.V2alpha.SubjectAlternateName)
  field(:days_until_expiration, 4, type: :uint64)
  field(:valid_from, 5, type: Google.Protobuf.Timestamp)
  field(:expiration_time, 6, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V2alpha.SubjectAlternateName do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: {atom, any}
        }
  defstruct [:name]

  oneof(:name, 0)
  field(:dns, 1, type: :string, oneof: 0)
  field(:uri, 2, type: :string, oneof: 0)
  field(:ip_address, 3, type: :string, oneof: 0)
end
