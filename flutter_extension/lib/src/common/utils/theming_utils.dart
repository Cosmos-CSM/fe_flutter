import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Utilities class that provides methods for theming.
final class ThemingUtils {
  /// Gets the current application [TBase].
  static TBase get<TBase extends IThemeData>(BuildContext context) {
    return ThemeManager.of(context).castData();
  }
}
