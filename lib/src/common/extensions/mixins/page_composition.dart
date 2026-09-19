import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:flutter/widgets.dart';

/// Mixes extensions for page composition related logic.
mixin PageComposition {
  /// Composes given [pageBuilder] wrapped with base `page` needed [Widget]s to
  /// generate the [PageContext].
  ///
  /// [ctx] Flutter engine building context.
  Widget composedBasePage(
    BuildContext ctx, {
    required Widget Function(PageContext pageCtx) pageBuilder,
  }) {
    final Size screenSize = MediaQuery.sizeOf(ctx);

    return LayoutBuilder(
      builder: (_, BoxConstraints constrains) {
        constrains = constrains.copyWith(
          minWidth: 500,
          minHeight: 500,
        );

        BoxConstraints normalizedConstriants = constrains.normalize();
        Size pageSize = normalizedConstriants.biggest;

        ScrollController hScroll = ScrollController();
        ScrollController vScroll = ScrollController();

        PageContext pageCtx = PageContext(
          ctx,
          pageSize: pageSize,
          windowSize: screenSize,
        );

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: hScroll,
          child: SingleChildScrollView(
            controller: vScroll,
            child: ConstrainedBox(
              constraints: normalizedConstriants,
              child: pageBuilder(pageCtx),
            ),
          ),
        );
      },
    );
  }
}
