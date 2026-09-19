import 'package:csm_view/csm_view.dart';

/// Represents a [SandboxViewBase] items group, creates a navigation access for the whole group
/// displaying inner items.
///
/// [ThemeBase] themee base type.
final class PackageSandboxGroup<ThemeBase extends SandboxThemeBase> extends PackageSandboxGroupBase<ThemeBase> {
  /// Creates a new instance.
  PackageSandboxGroup({
    super.icon,
    super.image,
    required super.name,
    required super.nodes,
    required super.description,
  });
}
