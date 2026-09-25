import 'package:flutter/material.dart';

/// Represents a `CSM View` customized [Widget].
abstract interface class IWidget {
  /// Widget padding.
  final EdgeInsets padding;

  /// Creates a new instance.
  const IWidget(this.padding);
}
