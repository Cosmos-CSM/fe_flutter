import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:csm_view/src/view/widgets/common/abstractions/bases/stateful_widget_base.dart';
import 'package:flutter/material.dart';

/// Draws an editable list, showing currently handled values and allowing to removing them or add new ones.
class ListEditor extends StatefulWidgetBase {
  /// Title displayed in header.
  final String title;

  /// Initial values for content, if they change will restore state using this values.
  final List<String> values;

  /// Spacing between items.
  final double spacing;

  /// Creates a new instance.
  const ListEditor({
    super.key,
    this.title = '',
    this.spacing = 16,
    required this.values,
  });

  @override
  State<ListEditor> createState() => _ListEditorState();
}

class _ListEditorState extends State<ListEditor> {
  // `State` - current editor values.
  late List<String> values = widget.values;

  @override
  void didUpdateWidget(covariant ListEditor oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.values != widget.values) {
      values = widget.values;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) {
          boxConstraints = boxConstraints.normalize();

          return Column(
            spacing: widget.spacing,
            children: <Widget>[
              // Content
              Column(
                children: <Widget>[
                  for (String value in values)
                    _ListEditorItem(
                      text: value,
                      width: boxConstraints.maxWidth,
                    ),
                ],
              ),

              // Add
              TextInput(
                label: 'New Option',
                hint: 'Add a new option',
              ),
            ],
          );
        },
      ),
    );
  }
}

///
class _ListEditorItem extends StatefulWidget {
  /// List item displayed value.
  final String text;

  /// List width space.
  final double width;

  /// Creates a new instance
  const _ListEditorItem({
    required this.text,
    required this.width,
  });

  @override
  State<_ListEditorItem> createState() => __ListEditorItemState();
}

///
class __ListEditorItemState extends State<_ListEditorItem> with ControlStatesHandler<CardControlThemeData, _ListEditorItem> {
  @override
  StatefulControlThemeData<CardControlThemeData> stateThemingFactory(IThemeData themeData) {
    return themeData.primaryControlCard;
  }

  @override
  Widget build(BuildContext context) {
    return PointerArea(
      onHover: onHover,
      child: ColoredBox(
        color: tData.bgColor ?? Colors.transparent,
        child: SizedBox(
          width: widget.width,
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Text(
              widget.text,
            ),
          ),
        ),
      ),
    );
  }
}
