import 'dart:async';

import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

/// Represents a `whisper` [Form].
abstract interface class IWhisperForm implements IPage {
  /// Whisper title.
  final String title;

  /// Whisper controls width.
  final double controlsWidth;

  /// Creates a new instance.
  const IWhisperForm(this.title, this.controlsWidth);

  /// Event called after the whisper is closed.
  FutureOr<void> onClose();

  /// Event called when the whisper perform action is triggered.
  FutureOr<void> onPerform();

  /// Composes the form view.
  ///
  /// [formState] - represents the [Form] handler state for composition and management.
  ///
  /// [pageCtx] - `CSM` framework view composition context data.
  Widget composeForm(GlobalKey<FormState> formState, PageContext pageCtx);
}
