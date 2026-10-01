import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';
import 'package:go_router/go_router.dart' hide RouteData;

/// Represents a [RoutingGraphBase] route change data.
final class RoutingData {
  /// Route data for this routing operation (current route data).
  final RouteData routeData;

  /// Absolute routing grapth path.
  final String absolutePath;

  /// Stores routing parameters.
  final Map<String, String> parameters;

  /// Browser page parameters injected in [Uri].
  final Map<String, String> pageParams;

  /// Sub-Route page key.
  final ValueKey<String>? pageKey;

  /// Creates a new instance.
  const RoutingData({
    this.pageKey,
    this.parameters = const <String, String>{},
    this.pageParams = const <String, String>{},
    required this.routeData,
    required this.absolutePath,
  });

  /// Creates a new instance from a [GoRouterState] and a [RouteData] object.
  ///
  /// [goState] - [GoRouter] framework's state data.
  ///
  /// [routeData] - [RoutingGraphBase] data.
  factory RoutingData.fromGo(GoRouterState goState, RouteData routeData) {
    final IRouter router = InjectorUtils.get();

    String? absolutePath = router.getAbsolutePath(routeData);

    return RoutingData(
      routeData: routeData,
      pageKey: goState.pageKey,
      absolutePath: absolutePath,
      parameters: goState.pathParameters,
      pageParams: goState.uri.queryParameters,
    );
  }
}
