import 'package:csm_view/csm_view.dart';

/// {abstract} class.
///
///
/// [ThemeBase] type of the [IThemeData] application base theming implementation.
///
/// Defines and handles base behavior for [SandboxPageBase] implementations, wich are complex [PackageLanding] view entries
/// to be routed and displayed correctly as a package development helping.
abstract class SandboxPageBase<ThemeBase extends SandboxThemeBase> extends SandboxPageNodeBase<ThemeBase> implements ISandboxPage<ThemeBase> {
  /// Creates a new [SandboxPageBase]
  const SandboxPageBase({
    super.icon,
    super.image,
    required super.name,
    required super.description,
  });
}
