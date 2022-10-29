import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/src/impl/presentation/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ToolCard extends StatelessWidget {
  final isFavoriteVisibleProvider = StateProvider<bool>((ref) => false);

  final Tool tool;

  ToolCard(this.tool, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      child: Consumer(
        builder: (context, ref, child) {
          final isFavoriteVisible = ref.watch(isFavoriteVisibleProvider);

          return MouseRegion(
            onEnter: (_) =>
                ref.read(isFavoriteVisibleProvider.notifier).state = true,
            onExit: (_) =>
                ref.read(isFavoriteVisibleProvider.notifier).state = false,
            child: YaruSelectableContainer(
              onTap: () => Get.toNamed(tool.route),
              selected: false,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      leading: Icon(tool.icon),
                      title: Text(tool.homeTitle),
                      subtitle: Text(
                        tool.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Consumer(
                    builder: (child, ref, _) {
                      final favorites = ref.watch(settingsProvider).favorites;

                      final isFavorite = favorites.contains(tool.name);

                      return Visibility(
                        visible: isFavoriteVisible,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                                isFavorite ? Icons.star : Icons.star_border),
                            onPressed: () async {
                              if (isFavorite) {
                                ref
                                    .read(settingsProvider.notifier)
                                    .removeFavorite(tool.name);
                              } else {
                                ref
                                    .read(settingsProvider.notifier)
                                    .addFavorite(tool.name);
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
