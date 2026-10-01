import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a { View } application layout.
abstract interface class IViewLayout extends Widget implements IPage {
  /// Current layout page to wrap.
  final Widget page;

  /// Creates a new [IViewLayout] object.
  const IViewLayout(
    this.page, {
    super.key,
  });
}
