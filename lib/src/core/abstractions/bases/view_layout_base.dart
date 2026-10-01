import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

/// Represents a { View } application layout.
abstract class ViewLayoutBase extends PageBase implements IViewLayout {
  /// Content to be wrapped by the [ViewLayoutBase].
  @override
  final Widget page;

  /// Creates a new instance.
  const ViewLayoutBase({
    super.key,
    required super.routingData,
    required this.page,
  });
}
