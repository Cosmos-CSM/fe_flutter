import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [SandboxViewBase] page building context data.
final class SandboxPageContext<ThemeBase extends SandboxThemeBase> {
  /// Theme data.
  final ThemeBase theme;

  /// Routing context data.
  final RoutingData routingData;

  /// Creates a new instance.
  const SandboxPageContext({required this.routingData, required this.theme});
}
