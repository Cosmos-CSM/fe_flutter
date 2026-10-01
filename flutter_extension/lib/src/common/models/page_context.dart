import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

/// Represents [IPage] context data.
class PageContext {
  /// Page size space.
  final Size pageSize;

  /// Current window size space.
  final Size windowSize;

  /// Framework building context.
  final BuildContext context;

  /// Creates a new instance.
  const PageContext(
    this.context, {
    required this.pageSize,
    required this.windowSize,
  });
}
