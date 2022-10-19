import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/global_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ToolCard extends StatelessWidget {
  final Tool tool;
  final RxBool isFavoriteVisible = false.obs;

  ToolCard(this.tool);
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      child: Obx(
        () => MouseRegion(
          onEnter: (_) => isFavoriteVisible.value = true,
          onExit: (_) => isFavoriteVisible.value = false,
          child: YaruSelectableContainer(
            onTap: () => Get.toNamed(tool.route),
            selected: false,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  child: ListTile(
                    leading: Icon(tool.icon),
                    title: Text(tool.homeTitle),
                    subtitle: Text(
                      tool.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Visibility(
                  visible: isFavoriteVisible.value,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(GlobalSettings.isFavorite(tool.name)
                          ? Icons.star
                          : Icons.star_border),
                      onPressed: () async {
                        if (GlobalSettings.isFavorite(tool.name)) {
                          await GlobalSettings.removeFavorite(tool.name);
                        } else {
                          await GlobalSettings.addFavorite(tool.name);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
