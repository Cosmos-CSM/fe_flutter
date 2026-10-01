import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

/// Draws a [Widget] that allows to proxy [PageBase] for minimal usage.
class PageProxy extends PageBase {
  /// Builder function to generate the page view.
  final Widget Function(PageContext pageCtx) pageBuilder;

  /// Creates a new instance.
  const PageProxy({
    super.key,
    required this.pageBuilder,
    required super.routingData,
  });

  @override
  Widget composePage(PageContext pageCtx) => pageBuilder(pageCtx);
}
