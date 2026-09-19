import 'package:csm_view/csm_view.dart';
import 'package:flutter/widgets.dart';

/// Represents a stateful handling page view.
abstract class StatefulPageBase extends StatefulWidget implements IPage {
  /// Page routing data.
  @override
  final RoutingData routingData;

  /// Creates a new instance.
  const StatefulPageBase({
    super.key,
    required this.routingData,
  });

  @override
  @Deprecated('This must not be overriden on StatefulPageBase implementations, use composeState instead.')
  State<StatefulWidget> createState() => composeState();

  /// Creates the mutable state for this widget at a given location in the tree.
  ///
  /// Subclasses should override this method to return a newly created
  /// instance of their associated [State] subclass.
  ///
  /// This is a proxy method created by CSM framework to support type matching
  /// interfaces for compoistion logic structures.
  @protected
  PageStateBase<StatefulPageBase> composeState();
}
