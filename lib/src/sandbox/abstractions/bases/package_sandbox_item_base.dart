import 'package:csm_view/csm_view.dart';

/// {abstract} class.
///
///
/// [ThemeBase] type of the [IThemeData] application base theming implementation.
///
/// Defines and handles base behavior for [PackageSandboxItemBase] implementations, wich are complex [PackageLanding] view entries
/// to be routed and displayed correctly as a package development helping.
abstract class PackageSandboxItemBase<ThemeBase extends SandboxThemeBase> extends SandboxPageNodeBase<ThemeBase> implements IPackageSandboxItem<ThemeBase> {
  /// Creates a new [PackageSandboxItemBase]
  const PackageSandboxItemBase({
    super.icon,
    super.image,
    required super.name,
    required super.description,
  });  
}
