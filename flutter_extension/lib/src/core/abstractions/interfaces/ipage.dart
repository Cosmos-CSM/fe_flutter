import 'package:flutter/material.dart' hide Route;
import 'package:flutter_extension/flutter_extension.dart';

/// Represents a { View Module } page.
abstract interface class IPage implements Widget {
  /// Page routing data.
  final RoutingData routingData;

  /// Creates a new instance.
  const IPage(this.routingData);
}
