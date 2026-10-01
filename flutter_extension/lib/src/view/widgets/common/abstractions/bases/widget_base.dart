import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a `CSM View` customized [Widget].
abstract class WidgetBase extends StatelessWidget implements IWidget {
  /// Widget padding.
  @override
  final EdgeInsets padding;

  /// Creates a new instance.
  const WidgetBase({
    this.padding = EdgeInsets.zero,
  });
}
