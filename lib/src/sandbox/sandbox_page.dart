import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart' hide Page;

/// Represents an interactive sandbox for a package component.
///
/// [ThemeBase] represents the base theming data.
final class SandboxPage<ThemeBase extends SandboxThemeBase> extends PackageSandboxItemBase<ThemeBase> {
  /// Function to build the page.
  ///
  /// [pageCtx] CSM Framework building context data.
  ///
  /// [sandboxPageCtx] sandbox context building data.
  final Widget Function(PageContext pageCtx, SandboxPageContext<ThemeBase> sandboxPageCtx) viewBuilder;

  /// Creates a new instance
  const SandboxPage({
    super.icon,
    super.image,
    required super.name,
    required this.viewBuilder,
    required super.description,
  });

  @override
  IPage composeNode(SandboxPageContext<ThemeBase> sandboxPageCtx) {
    return PageProxy(
      routingData: sandboxPageCtx.routingData,
      pageBuilder: (PageContext pageCtx) => viewBuilder(pageCtx, sandboxPageCtx),
    );
  }
}
