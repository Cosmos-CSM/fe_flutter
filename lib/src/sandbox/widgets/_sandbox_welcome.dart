part of '../abstractions/bases/sandbox_view_base.dart';

/// Draws a welcoming view.
///
/// [ThemeBase] represents the theme data base this [PageBase] uses.
final class _SandboxWelcome<ThemeBase extends SandboxThemeBase> extends PageBase {
  /// Name of the package being sandbox'd.
  final String name;

  /// General description of the package being sandbox'd.
  final DescriptionBuilder<ThemeBase> description;

  /// View routing grapth.
  final Map<RouteData, ISandboxPageNode<ThemeBase>> routingGraph;

  /// Creates a new [_SandboxWelcome] instance.
  const _SandboxWelcome({
    required this.name,
    required this.description,
    required this.routingGraph,
    required super.routingData,
  });

  @override
  Widget composePage(PageContext pageCtx) {
    BuildContext context = pageCtx.context;

    final ThemeBase theme = ThemingUtils.get(context);

    return SizedBox.fromSize(
      size: pageCtx.pageSize,
      child: Column(
        children: <Widget>[
          //* Welcome title header.
          Padding(
            padding: EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: Theme.of(context).textTheme.headlineSmall,
                children: <InlineSpan>[
                  //* Package name.
                  TextSpan(
                    text: name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextSpan(
                    text: ' sandbox',
                  ),
                ],
              ),
            ),
          ),

          //* Description
          Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Text.rich(
                description(
                  theme,
                  theme.page.fore,
                ),
              ),
            ),
          ),

          //* Sandbox entries cards.
          Expanded(
            child: SandboxCardsDashboard<ThemeBase>(
              sandboxEntries: routingGraph,
            ),
          )
        ],
      ),
    );
  }
}
