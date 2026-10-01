import 'package:csm_view/csm_view.dart';
import 'package:csm_view/src/view/widgets/display/side_drawer.dart';
import 'package:flutter/material.dart';

/// Represents a [SandboxStatefulPageContentBase.composeState] base requirement to succesfuly
/// compose a sandbox page view with their base handlers.
abstract class SandboxPageStateBase<SandboxStatefulPage extends StatefulPageBase, ThemeBase extends SandboxThemeBase> extends PageStateBase<SandboxStatefulPage> {
  /// Composes the content sandbox settings drawer view. Here should be all selectors to configure how is built the [Widget] being
  /// exposed in this sandbox page.
  Widget composeSettings(PageContext pageCtx);

  /// Composes the content view of the sandbox.
  Widget composeContent(PageContext pageCtx);

  @override
  Widget composePage(PageContext pageCtx) {
    return DrawerView(
      isOpen: true,
      title: 'Settings',
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: composeContent(pageCtx),
      ),
      drawer: composeSettings(pageCtx),
    );
  }
}
