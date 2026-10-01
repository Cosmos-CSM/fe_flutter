import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [SandboxViewBase] item, containing data to build the view and routing handling.
///
/// [ThemeBase] represents the theming type.
abstract class SandboxPageNodeBase<ThemeBase extends SandboxThemeBase> implements ISandboxPageNode<ThemeBase> {
  /// Entry name.
  @override
  final String name;

  /// Icon image decorator, if not provided [image] property would be used.
  @override
  final IconData? icon;

  /// Entry image decorator, if not provided [icon] property would be used.
  @override
  final ImageProvider? image;

  /// Entry description.
  @override
  final DescriptionBuilder<ThemeBase> description;

  /// Creates a new instance.
  const SandboxPageNodeBase({
    this.image,
    this.icon,
    required this.name,
    required this.description,
  });

  @override
  List<IRoutingGraphData> composeRoutes(GlobalKey<NavigatorState> navLayoutKey, GlobalKey<NavigatorState> entryLayoutKey) => <IRoutingGraphData>[];
}
