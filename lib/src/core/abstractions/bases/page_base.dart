import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:flutter/material.dart';

/// Represents a { View Module } page.
abstract class PageBase extends StatelessWidget with PageComposition implements IPage {
  /// Page routing data.
  @override
  final RoutingData routingData;

  /// Creates a new instance.
  const PageBase({
    super.key,
    required this.routingData,
  });

  /// Composes the page content.
  ///
  /// [pageCtx] represents the CSM Framework page composition context data.
  Widget composePage(PageContext pageCtx);

  @override
  Widget build(BuildContext context) {
    return composedBasePage(
      context,
      pageBuilder: composePage,
    );
  }
}
