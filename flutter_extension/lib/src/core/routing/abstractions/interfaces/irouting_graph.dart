import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';
import 'package:go_router/go_router.dart' hide RouteData;

///
abstract interface class IRoutingGraph implements RouterConfig<RouteMatchList> {
  /// { View } application routing graph routes.
  final List<IRoutingGraphData> routes;

  /// Creates a new instance.
  const IRoutingGraph(this.routes);
}
