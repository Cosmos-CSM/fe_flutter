import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart' hide Page;

/// Represents a [SandboxViewBase] items group, creates a navigation access for the whole group
/// displaying inner items.
///
/// [ThemeBase] themee base type.
abstract class SandboxPageGroupBase<ThemeBase extends SandboxThemeBase> extends SandboxPageNodeBase<ThemeBase> implements IPackageSandboxGroup<ThemeBase> {
  /// Group items.
  @override
  final List<ISandboxPage<ThemeBase>> nodes;

  /// Group items routing graph, for navigation behaviors.
  @override
  late final Map<RouteData, ISandboxPageNode<ThemeBase>> routesGraph;

  /// Creates a new instance.
  SandboxPageGroupBase({
    super.icon,
    super.image,
    required super.name,
    required this.nodes,
    required super.description,
  }) : assert(
          nodes.isNotEmpty,
          'Sandbox entries group must have items',
        ) {
    routesGraph = SandboxUtils.buildNavigationGraph(nodes);
  }

  @override
  List<IRoutingGraphData> composeRoutes(GlobalKey<NavigatorState> navLayoutKey, GlobalKey<NavigatorState> entryLayoutKey) {
    return SandboxUtils.buildRoutes(
      routesGraph,
      navLayoutKey,
      entryLayoutKey,
    ).toList();
  }

  @override
  IPage composeNode(SandboxPageContext<ThemeBase> sandboxPageCtx) {
    return PageProxy(
      routingData: sandboxPageCtx.routingData,
      pageBuilder: (PageContext pageCtx) {
        return SandboxCardsDashboard<ThemeBase>(
          sandboxEntries: routesGraph,
        );
      },
    );
  }
}
