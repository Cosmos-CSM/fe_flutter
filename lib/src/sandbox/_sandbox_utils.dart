import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

/// Type definition for [SandboxThemeBase]
typedef STB = SandboxThemeBase;

typedef SGraph<TB extends STB> = Map<RouteData, ISandboxPageNode<TB>>;

/// Type definition for [ISandboxPageNode].
typedef SNode<ThemeBase extends STB> = ISandboxPageNode<ThemeBase>;

/// Type definition for [List] of [SNode].
typedef SNodes<ThemeBase extends STB> = List<SNode<ThemeBase>>;

//! Deprecated

/// Type definition for a [Function] builder to generate a [PSEntry].
typedef PSEntryBuilder<ThemeBase extends STB> = SNode<ThemeBase> Function(RoutingData routingData);

/// Type definition for a [Function] builder to generate a [PSEntry].
typedef PSEntryBuilders<ThemeBase extends STB> = List<PSEntryBuilder<ThemeBase>>;

/// Provides utility methods for [Sandbox] feature purposes.
final class SandboxUtils {
  /// Builds sandbox graph context object from given [nodes] that represents the sandbox navigation values.
  static SGraph<ThemeBase> buildNavigationGraph<ThemeBase extends STB>(SNodes<ThemeBase> nodes) {
    SGraph<ThemeBase> graph = <RouteData, SNode<ThemeBase>>{};

    for (SNode<ThemeBase> sandboxItem in nodes) {
      String trimmedName = sandboxItem.name.replaceAll(' ', '_');
      String routePath = trimmedName.toLowerCase();
      RouteData routeData = RouteData(
        routePath,
        name: trimmedName,
      );

      graph[routeData] = sandboxItem;
    }

    return graph;
  }

  /// Builds sandbox graph context object from given [navGraph] that represents their [RouteData] with their [SNode] relation.
  static SGraph<ThemeBase> buildNodesGraph<ThemeBase extends STB>(SGraph<ThemeBase> navGraph) {
    SGraph<ThemeBase> nodesGraph = <RouteData, SNode<ThemeBase>>{};
    for (MapEntry<RouteData, SNode<ThemeBase>> navGraphEntry in navGraph.entries) {
      SNode<ThemeBase> psEntry = navGraphEntry.value;

      nodesGraph[navGraphEntry.key] = psEntry;

      if (psEntry case IPackageSandboxGroup<ThemeBase>(routesGraph: Map<RouteData, ISandboxPageNode<ThemeBase>> routingGraph)) {
        nodesGraph.addEntries(routingGraph.entries);
      }
    }

    return nodesGraph;
  }

  /// Builds the view routes format for the navigation framework based on given [nodesGraph], using their built
  /// [RouteData] and each [IPackageSandboxItem] they represent.
  static Iterable<IRoutingGraphData> buildRoutes<ThemeBase extends STB>(
    SGraph<ThemeBase> nodesGraph,
    NavigationState navLytKey,
    NavigationState nodeLytKey,
  ) sync* {
    for (MapEntry<RouteData, SNode<ThemeBase>> node in nodesGraph.entries) {
      yield RoutingGraphNode(
        node.key,
        routes: node.value.composeRoutes(navLytKey, nodeLytKey),
        pageBuilder: (BuildContext ctx, RoutingData routingData) {
          ThemeBase themeData = ThemingUtils.get(ctx);

          return node.value.composeNode(
            SandboxPageContext<ThemeBase>(
              routingData: routingData,
              theme: themeData,
            ),
          );
        },
      );
    }
  }
}
