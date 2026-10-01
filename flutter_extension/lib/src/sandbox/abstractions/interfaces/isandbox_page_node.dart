import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [SandboxViewBase] item, containing data to build the view and routing handling.
///
/// [ThemeBase] represents the theming type.
abstract interface class ISandboxPageNode<ThemeBase extends SandboxThemeBase> {
  /// Entry name.
  final String name;

  /// Icon image decorator, if not provided [image] property would be used.
  final IconData? icon;

  /// Entry image decorator.
  final ImageProvider? image;

  /// Entry description.
  final DescriptionBuilder<ThemeBase> description;

  /// Creates a new instance.
  const ISandboxPageNode(
    this.name,
    this.icon,
    this.image,
    this.description,
  );

  /// Composes the sandbox page view.
  ///
  /// [sandboxPageCtx] provides [SandboxViewBase] page building context data.
  IPage composeNode(SandboxPageContext<ThemeBase> sandboxPageCtx);

  /// Composes needed nested routes.
  ///
  /// [navLayoutKey] navigation layout key.
  ///
  /// [entryLayoutKey] entry layout key.
  List<IRoutingGraphData> composeRoutes(GlobalKey<NavigatorState> navLayoutKey, GlobalKey<NavigatorState> entryLayoutKey) => <IRoutingGraphData>[];
}
