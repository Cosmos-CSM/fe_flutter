import 'package:csm_view/csm_view.dart';
import 'package:flutter/cupertino.dart';

final class SelectorCardsConfig<TValue> {
  /// Number of cards per row.
  final int? rowCardsCount;

  /// Defined card size. Only when [style] is [SelectorStyles.cards].
  final WidgetSize? cardSize;

  /// Cards alignment on their main axis.
  final WrapAlignment alignment;

  /// Cards alignment on their cross axis.
  final WrapCrossAlignment crossAlignment;

  /// Event callback when [CardsSelector] values selection has changed. Will provide
  /// the new selected values [newSelection], the previous selection values [prevSelection] and
  /// the difference between the [newSelection] and [prevSelection] as [delta].
  final Function(List<TValue> newSelection, List<TValue> prevSelection, [List<TValue>? delta])? onMultiSelection;

  /// Event callback when [CardsSelector] value selection has changed. Will provide
  /// the new selected value [newSelected] and [prevSelected] value.
  final Function(TValue? newSelected, TValue? prevSelected)? onSingleSelection;

  const SelectorCardsConfig({
    double? spacing,
    this.cardSize,
    this.rowCardsCount,
    this.onMultiSelection,
    this.onSingleSelection,

    this.alignment = WrapAlignment.center,
    this.crossAlignment = WrapCrossAlignment.start,
  }) : assert(
          (cardSize != null) != (rowCardsCount != null),
          'Just one [cardsSize] or [rowCardsCount] property must be provided, not both, and at least one, to determine correctly each card size.',
        );
}
