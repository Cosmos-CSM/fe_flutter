import 'package:flutter/material.dart' hide Page;
import 'package:flutter_extension/flutter_extension.dart';

final class SandboxConfigurablePage<ThemeBase extends SandboxThemeBase> extends SandboxPageBase<ThemeBase> {
  /// Builder for the main item content.
  ///
  /// [viewContext] framweork building context.
  ///
  /// [windowSize] current window size.
  ///
  /// [theme] current theme data.
  final Widget Function(BuildContext viewContext, Size windowSize, ThemeBase theme) viewBuilder;

  /// Builder for the configurations panel content.
  ///
  /// [viewContext] framweork building context.
  ///
  /// [windowSize] current window size.
  ///
  /// [theme] current theme data.
  final Widget Function(BuildContext viewContext, Size windowSize, ThemeBase theme) configsBuilder;

  /// Creates a new instance.
  const SandboxConfigurablePage({
    required super.name,
    required this.viewBuilder,
    required super.description,
    required this.configsBuilder,
  });

  @override
  IPage composeNode(SandboxPageContext<ThemeBase> sandboxPageCtx) {
    return PageProxy(
      routingData: sandboxPageCtx.routingData,
      pageBuilder: (PageContext pageCtx) {
        return Container();
      },
    );
  }
}
