import 'package:csm_client_core/csm_client_core.dart';
import 'package:csm_view/csm_view.dart';
import 'package:flutter/widgets.dart';

///
mixin PageParamsHandlingMixin on IPage {
  /// Updates the given [key] page parameter with given [value], then redirects the page with the updated page params.
  void updateParam(BuildContext ctx, String key, String value) {
    Map<String, String> pageParams = routingData.pageParams;

    pageParams[key] = value;

    InjectorUtils.get<IRouter>().go(
      ctx,
      routingData.routeData,
      pageParams: pageParams,
    );
  }

  /// Gets the given [key] param from page parameters.
  TValue getParam<TValue>(String key) {
    return routingData.pageParams.get<TValue>(key);
  }
}
