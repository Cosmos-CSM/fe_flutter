import 'package:csm_view/csm_view.dart';
import 'package:flutter/widgets.dart';

/// Represents an state object from a [StatefulPageBase]. Handling the state and view composition
/// based on current state values.
abstract class PageStateBase<StatefulPage extends StatefulPageBase> extends State<StatefulPage> with PageComposition {
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
