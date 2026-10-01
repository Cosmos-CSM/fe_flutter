import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

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
