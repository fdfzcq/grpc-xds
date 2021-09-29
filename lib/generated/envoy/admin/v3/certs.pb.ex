defmodule Envoy.Admin.V3.Certificates do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          certificates: [Envoy.Admin.V3.Certificate.t()]
        }
  defstruct [:certificates]

  field(:certificates, 1, repeated: true, type: Envoy.Admin.V3.Certificate)
end

defmodule Envoy.Admin.V3.Certificate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ca_cert: [Envoy.Admin.V3.CertificateDetails.t()],
          cert_chain: [Envoy.Admin.V3.CertificateDetails.t()]
        }
  defstruct [:ca_cert, :cert_chain]

  field(:ca_cert, 1, repeated: true, type: Envoy.Admin.V3.CertificateDetails)
  field(:cert_chain, 2, repeated: true, type: Envoy.Admin.V3.CertificateDetails)
end

defmodule Envoy.Admin.V3.CertificateDetails.OcspDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          valid_from: Google.Protobuf.Timestamp.t() | nil,
          expiration: Google.Protobuf.Timestamp.t() | nil
        }
  defstruct [:valid_from, :expiration]

  field(:valid_from, 1, type: Google.Protobuf.Timestamp)
  field(:expiration, 2, type: Google.Protobuf.Timestamp)
end

defmodule Envoy.Admin.V3.CertificateDetails do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          path: String.t(),
          serial_number: String.t(),
          subject_alt_names: [Envoy.Admin.V3.SubjectAlternateName.t()],
          days_until_expiration: non_neg_integer,
          valid_from: Google.Protobuf.Timestamp.t() | nil,
          expiration_time: Google.Protobuf.Timestamp.t() | nil,
          ocsp_details: Envoy.Admin.V3.CertificateDetails.OcspDetails.t() | nil
        }
  defstruct [
    :path,
    :serial_number,
    :subject_alt_names,
    :days_until_expiration,
    :valid_from,
    :expiration_time,
    :ocsp_details
  ]

  field(:path, 1, type: :string)
  field(:serial_number, 2, type: :string)
  field(:subject_alt_names, 3, repeated: true, type: Envoy.Admin.V3.SubjectAlternateName)
  field(:days_until_expiration, 4, type: :uint64)
  field(:valid_from, 5, type: Google.Protobuf.Timestamp)
  field(:expiration_time, 6, type: Google.Protobuf.Timestamp)
  field(:ocsp_details, 7, type: Envoy.Admin.V3.CertificateDetails.OcspDetails)
end

defmodule Envoy.Admin.V3.SubjectAlternateName do
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
