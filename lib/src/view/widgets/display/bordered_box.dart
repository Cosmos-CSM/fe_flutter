import 'package:csm_view/csm_view.dart';
import 'package:flutter/material.dart';

/// Draws a border around a [Widget].
final class BorderedBox extends StatelessWidget {
  /// Wrapped widget bordered box.
  final Widget child;

  /// Border color, if not given will be used [FoundationThemeB.page] {fore} theming options.
  final Color? color;

  /// Border width size.
  final double thickness;

  /// Border radius values.
  final BorderRadiusGeometry? radius;

  /// Content [child] padding.
  final EdgeInsets padding;

  /// Sides to apply border.
  final List<AxisDirection> sides;

  /// Creates a new [BorderedBox] instance.
  const BorderedBox({
    super.key,
    this.color,
    this.radius,
    this.thickness = .75,
    this.padding = const EdgeInsets.only(
      top: 8,
    ),
    this.sides = const <AxisDirection>[
      AxisDirection.up,
      AxisDirection.down,
      AxisDirection.left,
      AxisDirection.right,
    ],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = color ?? ThemingUtils.get<IThemeData>(context).page.fore;
    BorderSide borderSide = BorderSide(
      color: borderColor,
      width: thickness,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border(
          top: sides.contains(AxisDirection.up) ? borderSide : BorderSide.none,
          left: sides.contains(AxisDirection.left) ? borderSide : BorderSide.none,
          bottom: sides.contains(AxisDirection.down) ? borderSide : BorderSide.none,
          right: sides.contains(AxisDirection.right) ? borderSide : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
