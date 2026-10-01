import 'package:csm_client_core/csm_client_core.dart' hide DataMap;
import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a { View } routing context handler.
abstract interface class IRouter {
  /// Moves the application [context] routing to the given [routeData] location.
  ///
  /// [route] target desired [RouteData] information.
  ///
  /// [ignoreRedirection] whether the [RouterBase] should avoid any [Redirection] trigger.
  ///
  /// [pushHistory] whether the [RouterBase] should push into the history the target [route] or just go directly to it removing all the previous [RouterBase] history.
  ///
  /// [extraData] extra data shared along [RouteData] resolutions.
  ///
  /// [allowLogs] whether the nethod can print logs.
  ///
  /// [pageParams] current page parameters, commonly passed through the application routing path as query parameters.
  void go(
    BuildContext context,
    RouteData routeData, {
    bool ignoreRedirection,
    bool allowLogs,
    bool pushHistory,
    DataMap? extraData,
    Map<String, String> pageParams,
  });

  /// Gets the [RouteData] from the given { View } application's [absolutePath].
  ///
  /// [absolutePath] - { View } application's path to get [RouteData].
  ///
  /// [allowLogs] - Whether the method must display logs.
  RouteData getRouteData(String absolutePath, [bool allowLogs]);

  /// Gets the absolute path calculation from a specific [RouteData] into the calculated [RouterBase] tree.
  ///
  /// [route] the required [RouteData]'s absolute path calculation.
  ///
  /// [allowLogs] whether the method can announce logs.
  String getAbsolutePath(RouteData route, [bool allowLogs]);

  /// Resolves development working route redirection.
  ///
  /// [routeData] - Target development route data.
  ///
  /// [currentPath] - Current { View } application's route path.
  ///
  /// [targetPath] - Routing request { View } application's target path.
  ///
  /// [allowLogs] - Whether the method must display logs.
  String? resolveDevRedirection(RouteData routeData, String currentPath, String? targetPath, [bool allowLogs]);

  /// Loads given [obj] using [IDecodable.decode] using current route page parameters (a.k.a query params).
  ///
  /// [viewCtx] is the current view context used to track the current view container used; commonly matter on multi window scenarios.
  ///
  /// [obj] instance that is used to load the data from the page parameters tracked [DataMap].
  void loadPageParams(BuildContext viewCtx, IDecodable obj);
}
