import 'package:csm_view/csm_view.dart';

/// Represents a [SandboxViewBase] page with configurable drawer for the content.
///
/// [ThemeBase] - represents the base theme data.
abstract class SandboxStatefulPageBase<ThemeBase extends SandboxThemeBase> extends SandboxPageNodeBase<ThemeBase> implements ISandboxPage<ThemeBase> {
  /// Creates a new instance
  const SandboxStatefulPageBase({
    super.icon,
    super.image,
    required super.name,
    required super.description,
  });

  @override
  SandboxStatefulPageContentBase<ThemeBase> composeNode(SandboxPageContext<ThemeBase> sandboxPageCtx);
}
