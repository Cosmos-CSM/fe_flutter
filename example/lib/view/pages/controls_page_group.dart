import 'package:csm_view/csm_view.dart';
import 'package:example/core/themes/vsanbod_theme_base.dart';
import 'package:example/view/pages/controls/selector_page.dart';
import 'package:flutter/cupertino.dart';

/// `Page` group for `controls` category [Widget]s
class ControlsPageGroup extends SandboxPageGroupBase<VSandboxThemeBase> {
  /// Creates a new instance.
  ControlsPageGroup()
      : super(
          name: 'Controls',
          description: (VSandboxThemeBase theme, Color foreColor) {
            return TextSpan(
              text: 'Control widgets are interactive components that initiate commands, events, or state changes in the application.'
                  'Their output is an action, not a value.'
                  'They exist to let the user do something — submit, open, close, navigate, toggle, activate.',
            );
          },
          nodes: <ISandboxPage<VSandboxThemeBase>>[
            SelectorPage(),
          ],
        );
}
