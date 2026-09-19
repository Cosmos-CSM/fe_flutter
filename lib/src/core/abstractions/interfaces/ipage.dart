import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart' hide Route;

/// Represents a { View Module } page.
abstract interface class IPage implements Widget {
  /// Page routing data.
  final RoutingData routingData;

  /// Creates a new instance.
  const IPage(this.routingData);
}
