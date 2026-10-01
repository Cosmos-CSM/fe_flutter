import 'package:csm_view/csm_view.dart' show IntDuration, ThemeDataBase, ThemingStateMixin;
import 'package:csm_view/src/view/widgets/_widgets_module.dart';
import 'package:flutter/material.dart';

/// Draws a container view [Widget] that handles a side opened drawer.
final class DrawerView extends StatefulWidget {
  /// View content.
  final Widget content;

  /// Drawer content.
  final Widget drawer;

  /// Whether the drawer is opened or closed.
  final bool isOpen;

  /// Drawer tab and drawer container title.
  final String title;

  /// Where in the view the drawer will be placed.
  final AxisDirection direction;

  /// Drawer size relative to their axis. Depending on [direction] the size will be taken
  /// from where it is placed to the counterwise side.
  final double size;

  /// Callback when the drawer is acted to close or open.
  final void Function(bool $event)? onAction;

  /// Creates a new instance
  const DrawerView({
    super.key,
    this.onAction,
    this.title = '',
    this.size = 350,
    this.isOpen = true,
    this.direction = AxisDirection.right,
    required this.content,
    required this.drawer,
  });

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

/// Handles state for [DrawerView].
class _DrawerViewState extends State<DrawerView> with ThemingStateMixin<DrawerView, ThemeDataBase> {
  /// Stores the specific update command that only touches
  /// points that are needed depending on [widget.direction]
  late void Function(BoxConstraints boxConstratints) updateCommand;

  /// A global key to keep [AnimatedPositioned] state for its animation.
  final GlobalKey animationKeeper = GlobalKey();

  /// `State` - whether the drawer is opened.
  late bool isOpen = widget.isOpen;

  /// `State` - whether the drawer is animating.
  bool isAnimating = false;

  /// Position on top.
  double? top;

  /// Position on left.
  double? left;

  /// Position on right.
  double? right;

  /// Position on bottom.
  double? bottom;

  /// The drawer size.
  WidgetSize drawerSize = WidgetSize(null, null);

  /// The content size.
  WidgetSize contentSize = WidgetSize(null, null);

  @override
  void initState() {
    super.initState();

    isOpen = widget.isOpen;
    determineUpdateCommand();
  }

  @override
  void didUpdateWidget(covariant DrawerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isOpen != widget.isOpen) {
      isOpen = widget.isOpen;
    }

    if (oldWidget.direction != widget.direction) {
      determineUpdateCommand();
    }
  }

  /// Determines the current [updateCommand] to use based on [widget.direction] value.
  void determineUpdateCommand() {
    switch (widget.direction) {
      case AxisDirection.up:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AxisDirection.right:
        updateCommand = (BoxConstraints boxConstratints) {
          boxConstratints = boxConstratints.normalize();

          drawerSize = WidgetSize(widget.size, boxConstratints.maxHeight);
          double contentWidh;
          if (isOpen) {
            right = 0;
            contentWidh = boxConstratints.maxWidth - widget.size;
          } else {
            right = -(widget.size);
            contentWidh = boxConstratints.maxWidth;
          }

          contentSize = WidgetSize(contentWidh, null);
        };
        break;
      case AxisDirection.down:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AxisDirection.left:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  /// `Event` function to open or close the drawer based on given [event], true for open, false for close.
  void toogleDrawer(bool $event) {
    if ($event != isOpen) {
      isAnimating = true;
    }

    isOpen = $event;
    setState(() {});
  }

  /// `Event` function to indicate the Drawer open / close animation has finished.
  void onAnimationFinish() {
    isAnimating = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Text titleText = Text(
      widget.title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      ),
    );

    return LayoutBuilder(
      builder: (_, BoxConstraints constrains) {
        updateCommand(constrains);

        return Stack(
          children: <Widget>[
            // Drawer
            AnimatedPositioned(
              key: animationKeeper,
              right: right,
              curve: Curves.easeOutCubic,
              duration: 1200.miliseconds,
              onEnd: onAnimationFinish,
              child: BorderedBox(
                thickness: 1,
                padding: EdgeInsets.zero,
                child: SizedBox(
                  width: drawerSize.width,
                  height: drawerSize.height,
                  child: Column(
                    children: <Widget>[
                      // Drawer title.

                      if (widget.title.isNotEmpty)
                        BorderedBox(
                          thickness: .8,
                          padding: EdgeInsets.zero,
                          sides: <AxisDirection>[
                            AxisDirection.down,
                          ],
                          child: SizedBox(
                            width: constrains.maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // Title.
                                  titleText,

                                  // Fold Button.
                                  IconButton(
                                    color: themeData.page.fore,
                                    icon: Icon(
                                      Icons.arrow_right,
                                      applyTextScaling: true,
                                      color: themeData.page.fore,
                                    ),
                                    onPressed: () => toogleDrawer(false),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                      // Drawer content.
                      widget.drawer,
                    ],
                  ),
                ),
              ),
            ),

            // Drawer Tab
            if (!isOpen && !isAnimating)
              Positioned(
                right: 0,
                child: BorderedBox(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: drawerSize.height,
                    child: Column(
                      spacing: 12,
                      children: <Widget>[
                        // Open drawer action.
                        IconButton(
                          onPressed: () => toogleDrawer(true),
                          icon: Icon(
                            Icons.arrow_left,
                            applyTextScaling: true,
                            color: themeData.page.fore,
                          ),
                        ),

                        // Vertical title.
                        RotatedBox(
                          quarterTurns: 3,
                          child: titleText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // Content
            Positioned(
              left: 0,
              child: AnimatedSize(
                duration: 1200.miliseconds,
                child: SizedBox(
                  width: contentSize.width,
                  child: widget.content,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
