import 'package:csm_view/csm_view.dart';

/// Represents a [SandboxViewBase] items group, creates a navigation access for the whole group
/// displaying inner items.
///
/// [ThemeBase] themee base type.
abstract interface class IPackageSandboxGroup<ThemeBase extends SandboxThemeBase> implements ISandboxPageNode<ThemeBase> {
  /// Group items.
  final List<ISandboxPage<ThemeBase>> nodes;

  /// Group items routing graph, for navigation behaviors.
  final Map<RouteData, ISandboxPageNode<ThemeBase>> routesGraph;

  /// Creates a new instance.
  const IPackageSandboxGroup(
    this.nodes,
    this.routesGraph,
  );
}
