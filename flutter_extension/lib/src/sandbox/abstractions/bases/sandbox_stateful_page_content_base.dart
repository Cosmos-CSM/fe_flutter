import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [SandboxStatefulPageBase] content page.
abstract class SandboxStatefulPageContentBase<ThemeBase extends SandboxThemeBase> extends StatefulPageBase {
  /// Creates a new instance.
  const SandboxStatefulPageContentBase({required super.routingData});

  @override
  SandboxPageStateBase<StatefulPageBase, ThemeBase> composeState();
}
