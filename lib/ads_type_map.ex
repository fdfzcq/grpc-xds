defmodule GRPC.XDS.ADS.TypeMap do
  def type_atom_to_type_url(),
    do: %{
      listener: google_prefix() <> "envoy.config.listener.v3.Listener",
      route_configuration: google_prefix() <> "envoy.config.route.v3.RouteConfiguration",
      scoped_route_configuration:
        google_prefix() <> "envoy.config.route.v3.ScopeRouteConfiguration",
      virtual_host: google_prefix() <> "envoy.config.route.v3.VirtualHost",
      cluster: google_prefix() <> "envoy.config.cluster.v3.Cluster",
      cluster_load_assignment: google_prefix() <> "envoy.config.endpoint.v3.ClusterLoadAssignment"
    }

  def type_url_to_type_atom(),
    do: %{
      (google_prefix() <> "envoy.config.listener.v3.Listener") => :listener,
      (google_prefix() <> "envoy.config.route.v3.RouteConfiguration") => :route_configuration,
      (google_prefix() <> "envoy.config.route.v3.ScopeRouteConfiguration") =>
        :scoped_route_configuration,
      (google_prefix() <> "envoy.config.route.v3.VirtualHost") => :virtual_host,
      (google_prefix() <> "envoy.config.cluster.v3.Cluster") => :cluster,
      (google_prefix() <> "envoy.config.endpoint.v3.ClusterLoadAssignment") =>
        :cluster_load_assignment
    }

  def type_url_to_proto_module(),
    do: %{
      (google_prefix() <> "envoy.config.listener.v3.Listener") =>
        Envoy.Config.Listener.V3.Listener,
      (google_prefix() <> "envoy.config.route.v3.RouteConfiguration") =>
        Envoy.Config.Route.V3.RouteConfiguration,
      (google_prefix() <> "envoy.config.route.v3.ScopeRouteConfiguration") =>
        Envoy.Config.Route.V3.ScopedRouteConfiguration,
      (google_prefix() <> "envoy.config.route.v3.VirtualHost") =>
        Envoy.Config.Route.V3.VirtualHost,
      (google_prefix() <> "envoy.config.cluster.v3.Cluster") => Envoy.Config.Cluster.V3.Cluster,
      (google_prefix() <> "envoy.config.endpoint.v3.ClusterLoadAssignment") =>
        Envoy.Config.Endpoint.V3.ClusterLoadAssignment
    }

  defp google_prefix(), do: "type.googleapis.com/"
end
