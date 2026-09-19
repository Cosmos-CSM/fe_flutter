
import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

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
