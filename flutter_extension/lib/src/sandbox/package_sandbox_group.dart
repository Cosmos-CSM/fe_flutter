import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [SandboxViewBase] items group, creates a navigation access for the whole group
/// displaying inner items.
///
/// [ThemeBase] themee base type.
final class PackageSandboxGroup<ThemeBase extends SandboxThemeBase> extends SandboxPageGroupBase<ThemeBase> {
  /// Creates a new instance.
  PackageSandboxGroup({
    super.icon,
    super.image,
    required super.name,
    required super.nodes,
    required super.description,
  });
}
