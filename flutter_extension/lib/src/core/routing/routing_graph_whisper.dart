import 'package:flutter_extension/flutter_extension.dart';

/// Represents a [RoutingGraphBase] application's whisper route, a whisper is a modal routed page.
final class RoutingGraphWhisperData<T> extends RoutingGraphWhisperDataBase<T> {
  /// Creates a new instance.
  RoutingGraphWhisperData(
    super.routeOptions, {
    required super.pageBuilder,
    required super.whisperOptions,
    super.onDispose,
    super.redirection,
    super.routes,
    super.parentNavigationState,
  });
}
