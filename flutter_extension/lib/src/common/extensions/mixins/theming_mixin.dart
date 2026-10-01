import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Provide methods to access and handle theming purposes easely.
mixin ThemingMixin {
  /// Gets the current application theme data based on the given [context].
  TThemeBase getTheme<TThemeBase extends IThemeData>(BuildContext context) {
    return ThemingUtils.get(context);
  }
}
