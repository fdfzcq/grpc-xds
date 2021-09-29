defmodule Envoy.Type.StatusCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :Empty
          | :Continue
          | :OK
          | :Created
          | :Accepted
          | :NonAuthoritativeInformation
          | :NoContent
          | :ResetContent
          | :PartialContent
          | :MultiStatus
          | :AlreadyReported
          | :IMUsed
          | :MultipleChoices
          | :MovedPermanently
          | :Found
          | :SeeOther
          | :NotModified
          | :UseProxy
          | :TemporaryRedirect
          | :PermanentRedirect
          | :BadRequest
          | :Unauthorized
          | :PaymentRequired
          | :Forbidden
          | :NotFound
          | :MethodNotAllowed
          | :NotAcceptable
          | :ProxyAuthenticationRequired
          | :RequestTimeout
          | :Conflict
          | :Gone
          | :LengthRequired
          | :PreconditionFailed
          | :PayloadTooLarge
          | :URITooLong
          | :UnsupportedMediaType
          | :RangeNotSatisfiable
          | :ExpectationFailed
          | :MisdirectedRequest
          | :UnprocessableEntity
          | :Locked
          | :FailedDependency
          | :UpgradeRequired
          | :PreconditionRequired
          | :TooManyRequests
          | :RequestHeaderFieldsTooLarge
          | :InternalServerError
          | :NotImplemented
          | :BadGateway
          | :ServiceUnavailable
          | :GatewayTimeout
          | :HTTPVersionNotSupported
          | :VariantAlsoNegotiates
          | :InsufficientStorage
          | :LoopDetected
          | :NotExtended
          | :NetworkAuthenticationRequired

  field(:Empty, 0)
  field(:Continue, 100)
  field(:OK, 200)
  field(:Created, 201)
  field(:Accepted, 202)
  field(:NonAuthoritativeInformation, 203)
  field(:NoContent, 204)
  field(:ResetContent, 205)
  field(:PartialContent, 206)
  field(:MultiStatus, 207)
  field(:AlreadyReported, 208)
  field(:IMUsed, 226)
  field(:MultipleChoices, 300)
  field(:MovedPermanently, 301)
  field(:Found, 302)
  field(:SeeOther, 303)
  field(:NotModified, 304)
  field(:UseProxy, 305)
  field(:TemporaryRedirect, 307)
  field(:PermanentRedirect, 308)
  field(:BadRequest, 400)
  field(:Unauthorized, 401)
  field(:PaymentRequired, 402)
  field(:Forbidden, 403)
  field(:NotFound, 404)
  field(:MethodNotAllowed, 405)
  field(:NotAcceptable, 406)
  field(:ProxyAuthenticationRequired, 407)
  field(:RequestTimeout, 408)
  field(:Conflict, 409)
  field(:Gone, 410)
  field(:LengthRequired, 411)
  field(:PreconditionFailed, 412)
  field(:PayloadTooLarge, 413)
  field(:URITooLong, 414)
  field(:UnsupportedMediaType, 415)
  field(:RangeNotSatisfiable, 416)
  field(:ExpectationFailed, 417)
  field(:MisdirectedRequest, 421)
  field(:UnprocessableEntity, 422)
  field(:Locked, 423)
  field(:FailedDependency, 424)
  field(:UpgradeRequired, 426)
  field(:PreconditionRequired, 428)
  field(:TooManyRequests, 429)
  field(:RequestHeaderFieldsTooLarge, 431)
  field(:InternalServerError, 500)
  field(:NotImplemented, 501)
  field(:BadGateway, 502)
  field(:ServiceUnavailable, 503)
  field(:GatewayTimeout, 504)
  field(:HTTPVersionNotSupported, 505)
  field(:VariantAlsoNegotiates, 506)
  field(:InsufficientStorage, 507)
  field(:LoopDetected, 508)
  field(:NotExtended, 510)
  field(:NetworkAuthenticationRequired, 511)
end

defmodule Envoy.Type.HttpStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: Envoy.Type.StatusCode.t()
        }
  defstruct [:code]

  field(:code, 1, type: Envoy.Type.StatusCode, enum: true)
end
