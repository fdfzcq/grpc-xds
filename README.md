# GrpcXds

This is a hack project that uses envoy's xDS gRPC API for service discovery. The implementation has proved to work with GCP's traffic director. Currently there are still many drawbacks in the implementation and this should not be used in prod. To name a few drawbacks:

1. Continuous stream doesn't work for reason, so for each gRPC call, a new stream is created and closed subsequently.
2. The elixir gRPC library has to be pinned to a specific version because the latest master (at the time of writing) doesn't work and neither did earlier versions.
3. This only serves the purpose of service discovery and gives a list of IPs with highest weight according to the control plane. Extra load balancing is needed to choose an address.
4. Only ADS is implemented for the sake of service discovery, but gRPC doesn't really need other xDS protocols.
5. The GenServer was meant for caching but no caches are implemented yet.

To use, call `GRPC.XDS.ADS.get_service_resource(<name>)` where `name` is a string of your service's discovery name.
