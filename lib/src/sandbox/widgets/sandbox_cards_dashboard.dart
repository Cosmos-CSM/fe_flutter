import 'package:csm_view/csm_view.dart' hide LayoutBuilder;
import 'package:flutter/material.dart';

final class SandboxCardsDashboard<ThemeBase extends STB> extends StatelessWidget {
  final Map<RouteData, ISandboxPageNode<ThemeBase>> sandboxEntries;

  const SandboxCardsDashboard({
    super.key,
    required this.sandboxEntries,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox.expand(
        child: LayoutBuilder(
          builder: (BuildContext viewContext, BoxConstraints cardsContainerConstraints) {
            const BoxConstraints cardConstraints = BoxConstraints(
              maxWidth: 425,
              minWidth: 225,
            );
            cardsContainerConstraints = cardsContainerConstraints.normalize();
            double widthSpace = cardsContainerConstraints.biggest.width;
            double cardWidth = widthSpace / 4;

            return SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: sandboxEntries.entries.map<Widget>(
                  (MapEntry<RouteData, ISandboxPageNode<ThemeBase>> sandboxRoutedEntry) {
                    return ConstrainedBox(
                      constraints: cardConstraints,
                      child: AspectRatio(
                        aspectRatio: 2 / 1,
                        child: SizedBox(
                          width: cardWidth,
                          child: PackageSandboxWelcomeEntryCard<ThemeBase>(
                            routeData: sandboxRoutedEntry.key,
                            sandboxItem: sandboxRoutedEntry.value,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
