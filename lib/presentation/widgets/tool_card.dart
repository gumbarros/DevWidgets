import 'package:devtoys/domain/extensions/icon_data_extensions.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ToolCard extends StatelessWidget {
  final Tool tool;
  final Rx<Color> cardColor = Colors.transparent.obs;

  ToolCard(this.tool);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Obx(
        () => Card(
          surfaceTintColor: cardColor.value,
          child: YaruSelectableContainer(
            selected: false,
            onTap: () => Get.toNamed(tool.route),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    // margin: const EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        color: Get.theme.hoverColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0))),
                    child: Center(
                        child: !tool.icon.isMaterialIcon()
                            ? FaIcon(
                                tool.icon,
                                size: 35,
                              )
                            : Icon(tool.icon, size: 40))),
                SizedBox(
                  width: Get.width / 7,
                  height: Get.height / 7,
                  child: Column(
                    children: [
                      Text(
                        tool.homeTitle,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Text(tool.description,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
