import 'package:flutter_extension/flutter_extension.dart';

/// Represents a package sandbox item who composes an user interface page to interact and read how a package component works.
///
/// [ThemeBase] represents the theming type.
abstract interface class ISandboxPage<ThemeBase extends SandboxThemeBase> implements ISandboxPageNode<ThemeBase> {
  /// Creates a new instance.
  const ISandboxPage();
}
