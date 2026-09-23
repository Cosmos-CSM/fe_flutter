import 'dart:async';

import 'package:csm_view/csm_view.dart';
import 'package:example/core/themes/vsanbod_theme_base.dart';
import 'package:example/core/themes/vsandbox_theme_dark.dart';
import 'package:example/core/themes/vsandbox_theme_light.dart';
import 'package:example/data/mocks/service_mock.dart';
import 'package:example/view/pages/controls_page_group.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    PakageExampleSandbox(),
  );
}

/// Package sandbox configuration, entry point where the example sandbox is built and configured.
final class PakageExampleSandbox extends SandboxViewBase<VSandboxThemeBase> {
  /// Creates a new instance.
  PakageExampleSandbox()
      : super(
          name: 'CSM View',
          description: (VSandboxThemeBase theme, Color foreColor) {
            return TextSpan(
              text: 'Sandbox solution to interact and consult details about ',
              style: TextStyle(
                color: foreColor,
                fontSize: 16,
              ),
              children: <InlineSpan>[
                //* Package name
                TextSpan(
                  text: 'CSM View',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' widgets and another components',
                ),
              ],
            );
          },
          nodes: <ISandboxPageNode<VSandboxThemeBase>>[
            // > Controls group
            ControlsPageGroup(),
          ],
        );

  @override
  List<VSandboxThemeBase> bootstrapTheming() {
    return <VSandboxThemeBase>[
      VSandboxThemeDark(),
      VSandboxThemeLight(),
    ];
  }

  @override
  FutureOr<void> initView(BuildContext context) {
    InjectorUtils.addSingleton<IServiceEx>(ServiceMock());

    return super.initView(context);
  }
}
