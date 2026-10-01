import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part '../../layouts/_package_sandbox_entry_layout/_package_sandbox_entry_layout.dart';
part '../../layouts/_package_sandbox_entry_layout/_package_sandbox_device_details.dart';

part '../../widgets/_sandbox_welcome.dart';

/// View home route.
final RouteData _homeRouteData = RouteData(
  '',
  name: 'home',
);

/// Represents a package sandbox view, which provides user interactive interfaces to see and check how package
/// components behave.
///
/// [ThemeBase] theme base type.
abstract class SandboxViewBase<ThemeBase extends SandboxThemeBase> extends ViewModuleBase {
  /// Package name.
  final String name;

  /// Package description.
  final DescriptionBuilder<ThemeBase> description;

  /// Sanbox entries builders.
  final List<ISandboxPageNode<ThemeBase>> nodes;

  /// Creates a new instance.
  const SandboxViewBase({
    super.key,
    required this.name,
    required this.description,
    required this.nodes,
  });

  @override
  List<ThemeBase> bootstrapTheming();

  @override
  List<IRoutingGraphData> bootstrapRouting() {
    final NavigationState itemLayoutKey = GlobalKey();
    final NavigationState navigationLayoutKey = GlobalKey();

    SGraph<ThemeBase> navGraph = SandboxUtils.buildNavigationGraph(nodes);
    SGraph<ThemeBase> nodesGraph = SandboxUtils.buildNodesGraph(navGraph);

    return <IRoutingGraphData>[
      ///* NavigationLayout
      RoutingGraphLayout(
        navigatorStateKey: navigationLayoutKey,
        routes: <IRoutingGraphData>[
          //* Home Route
          RoutingGraphNode(
            _homeRouteData,
            pageBuilder: (BuildContext ctx, RoutingData routingData) => _SandboxWelcome<ThemeBase>(
              name: name,
              routingGraph: navGraph,
              routingData: routingData,
              description: description,
            ),
          ),

          //* Entries Layout
          RoutingGraphLayout(
            routes: SandboxUtils.buildRoutes(navGraph, navigationLayoutKey, itemLayoutKey).toList(),
            navigatorStateKey: itemLayoutKey,
            layoutBuilder: (BuildContext ctx, RoutingData routingData, Widget page) {
              ISandboxPageNode<ThemeBase> node = nodesGraph[routingData.routeData]!;

              return _PackageSandboxEntryLayout<ThemeBase>(
                page: page,
                node: node,
                routingData: routingData,
              );
            },
          ),
        ],
        layoutBuilder: (BuildContext ctx, RoutingData routingData, Widget page) {
          return NavigationLayout(
            page: page,
            routingData: routingData,
            homeRouteData: _homeRouteData,
            navigationNodes: navGraph.entries.map<NavigationLayoutNode>(
              (MapEntry<RouteData, ISandboxPageNode<ThemeBase>> navigationRoute) {
                return NavigationLayoutNode(
                  title: navigationRoute.value.name,
                  routeData: navigationRoute.key,
                );
              },
            ).toList(),
          );
        },
      ),
    ];
  }

  @override
  Widget bootstrapBuild(BuildContext context, Widget? app) {
    SandboxThemeBase theme = ThemingUtils.get(context);

    return super.bootstrapBuild(
      context,
      ColoredBox(
        color: theme.page.back,
        child: Theme(
          data: ThemeData(
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                color: theme.page.fore,
              ),
            ),
          ),
          child: DefaultTextStyle(
            key: UniqueKey(),
            style: TextStyle(
              color: theme.page.fore,
            ),
            child: app!,
          ),
        ),
      ),
    );
  }
}
