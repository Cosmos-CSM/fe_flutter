import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:csm_view/src/view/widgets/controls/selector/abstractions/interfaces/iselector_widget.dart';
import 'package:flutter/material.dart';

export 'models/selector_cards_config.dart';

/// Draws a selector handling [Widget] based on cards.
///
/// _Inner card widget uses [IThemeData.primaryControlCard] theming data_
final class CardsSelector<TValue> extends StatefulWidget implements ISelectorWidget<TValue> {
  /// Spacing between cards.
  final double spacing;

  /// Selectable values.
  final List<NamedValue<TValue>> values;

  /// Pre selected items.
  final List<NamedValue<TValue>> preSelection;

  /// [Widget] configuration.
  final SelectorCardsConfig<TValue> configs;

  /// Event callback when [CardsSelector] value selection has changed. Will provide
  /// the new selected value [newSelected] and [prevSelected] value.
  @override
  final Function(TValue? newSelected, TValue? prevSelected)? onSingleSelection;

  /// Event callback when [CardsSelector] values selection has changed. Will provide
  /// the new selected values [newSelection], the previous selection values [prevSelection] and
  /// the difference between the [newSelection] and [prevSelection] as [delta].
  @override
  final Function(List<TValue> newSelection, List<TValue> prevSelection, [List<TValue>? delta])? onMultiSelection;

  /// Creates a new instance.
  const CardsSelector({
    super.key,
    required this.values,
    required this.configs,
    double? spacing,
    this.onMultiSelection,
    this.onSingleSelection,
    this.preSelection = const <NamedValue<Never>>[],
  }) : spacing = spacing ?? 4;

  @override
  State<CardsSelector<TValue>> createState() => _CardsSelectorState<TValue>();
}

/// Handles [State] for [CardsSelector].
final class _CardsSelectorState<TValue> extends State<CardsSelector<TValue>> {
  /// Whether the config is for a single selection selector.
  late bool isSingleSelection = widget.configs.onSingleSelection != null;

  /// Selected items.
  Map<String, NamedValue<TValue>> selection = <String, NamedValue<TValue>>{};

  @override
  void initState() {
    super.initState();

    /// Filling selection with given preselected values.
    for (NamedValue<TValue> preSelectedValue in widget.preSelection) {
      selection[preSelectedValue.name] = preSelectedValue;
    }
  }

  @override
  void didUpdateWidget(covariant CardsSelector<TValue> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.configs != widget.configs) {
      isSingleSelection = widget.configs.onSingleSelection != null;
    }
  }

  /// Event callback when an option is selected.
  void onOptionSelected(NamedValue<TValue> value) {
    bool isSelected = selection.containsKey(value.name);

    if (isSelected) {
      selection.remove(value.name);
    } else if (isSingleSelection) {
      selection.clear();
      selection[value.name] = value;
    } else {
      selection[value.name] = value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SelectorCardsConfig<TValue> config = widget.configs;

    return LayoutBuilder(
      builder: (_, BoxConstraints boxConstraints) {
        boxConstraints = boxConstraints.normalize();

        // If rowCardsCount is given we override the size to math row size.
        double cardSpacing = widget.spacing;
        WidgetSize? widgteSize = config.cardSize;
        if (config.rowCardsCount != null) {
          double cardWidth = (boxConstraints.maxWidth - (cardSpacing * 4)) / config.rowCardsCount!;
          widgteSize = WidgetSize(cardWidth, null);
        }

        return Wrap(
          spacing: cardSpacing,
          runSpacing: cardSpacing,
          alignment: config.alignment,
          crossAxisAlignment: config.crossAlignment,
          children: widget.values.map(
            (NamedValue<TValue> value) {
              return _SelectorCard<TValue>(
                value: value,
                size: widgteSize,
                isSelected: selection.containsKey(value.name),
                onClick: () => onOptionSelected(value),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

/// A [Widget] that draws a selectable value card item.
final class _SelectorCard<TValue> extends StatefulWidget {
  /// Value data.
  final NamedValue<TValue> value;

  /// Card size.
  final WidgetSize? size;

  /// Whether the item is selected.
  final bool isSelected;

  /// Control theming. When not provided takaes from [IThemeData.primaryControlCard].
  final StatefulControlThemeData<CardControlThemeData>? theming;

  /// Event callback when control gets clicked.
  final VoidCallback onClick;

  /// Creates a new instance.
  const _SelectorCard({
    this.size,
    this.theming,
    required this.value,
    required this.onClick,
    required this.isSelected,
  });

  @override
  State<_SelectorCard<TValue>> createState() => _SelectorCardState<TValue>();
}

/// Handles [State] for [_SelectorCard].
final class _SelectorCardState<TValue> extends State<_SelectorCard<TValue>> with ControlStatesHandler<CardControlThemeData, _SelectorCard<TValue>> {
  @override
  StatefulControlThemeData<CardControlThemeData> stateThemingFactory(IThemeData themeData) {
    if (widget.theming != null) return widget.theming!;

    return themeData.primaryControlCard;
  }

  @override
  void initState() {
    super.initState();

    if (widget.isSelected) {
      states.add(WidgetState.selected);
    }
  }

  @override
  void didUpdateWidget(covariant _SelectorCard<TValue> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.theming != null) {
      theming = widget.theming!;
      tData = evaluateTheming();
    }

    widget.isSelected ? states.add(WidgetState.selected) : states.remove(WidgetState.selected);
    tData = evaluateTheming();
  }

  /// Event callback when this gets clicked.
  void onClick() {
    widget.onClick();
  }

  @override
  Widget build(BuildContext context) {
    return PointerArea(
      cursor: SystemMouseCursors.click,
      onHover: onHover,
      onClick: onClick,
      child: AnimatedContainer(
        duration: 5.seconds,
        decoration: BoxDecoration(
          border: BoxBorder.fromBorderSide(
            BorderSide(
              color: tData.borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          color: tData.bgColor,
        ),
        child: SizedBox(
          width: widget.size?.width,
          height: widget.size?.height,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Center(
              child: Text(
                widget.value.name,
                style: tData.txtStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
