import 'package:csm_view/src/view/widgets/common/abstractions/interfaces/iwidget.dart';
import 'package:flutter/material.dart';

/// Represents a `CSM View` customized [Widget].
abstract class StatefulWidgetBase extends StatefulWidget implements IWidget {
  /// Widget padding.
  @override
  final EdgeInsets padding;

  /// Creates a new instance.
  const StatefulWidgetBase({
    required super.key,
    this.padding = EdgeInsets.zero,
  });
}
