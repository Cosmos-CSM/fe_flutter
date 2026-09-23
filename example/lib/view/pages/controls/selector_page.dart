import 'package:csm_view/csm_view.dart';
import 'package:example/core/themes/vsanbod_theme_base.dart';
import 'package:flutter/material.dart';

/// Represents a sandbox page for `Selector` [Widget].
class SelectorPage extends SandboxStatefulPageBase<VSandboxThemeBase> {
  /// Creates a new instance
  SelectorPage()
      : super(
          name: 'Selector',
          description: (VSandboxThemeBase theme, Color foreColor) {
            return TextSpan(
              text: '',
            );
          },
        );

  @override
  SandboxStatefulPageContentBase<VSandboxThemeBase> composeNode(SandboxPageContext<VSandboxThemeBase> sandboxPageCtx) {
    return _SelectorPageContent(
      routingData: sandboxPageCtx.routingData,
    );
  }
}

class _SelectorPageContent extends SandboxStatefulPageContentBase<VSandboxThemeBase> {
  const _SelectorPageContent({
    required super.routingData,
  });

  @override
  SandboxPageStateBase<StatefulPageBase, VSandboxThemeBase> composeState() => _SelectorPageContentState();
}

class _SelectorPageContentState extends SandboxPageStateBase<_SelectorPageContent, VSandboxThemeBase> {
  @override
  Widget composeContent(PageContext pageCtx) {
    return SizedBox.fromSize(
      size: pageCtx.pageSize,
      child: Selector<String>(
        cardsConfig: SelectorCardsConfig<String>(
          rowCardsCount: 5,
        ),
        values: <NamedValue<String>>[
          NamedValue<String>('Option 1', '1'),
        ],
      ),
    );
  }

  @override
  Widget composeSettings(PageContext pageCtx) {
    throw UnimplementedError();
  }
}
