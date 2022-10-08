import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolCard extends StatelessWidget {
  final Tool tool;
  final Rx<Color> cardColor = Colors.transparent.obs;

  ToolCard(this.tool);

  void onHoverIn(PointerEvent _) {
    cardColor.value = Color.fromARGB(99, 132, 132, 132);
  }

  void onHoverOut(PointerEvent _) {
    cardColor.value = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, bottom: 80, right: 40, left: 40),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: onHoverIn,
        onExit: onHoverOut,
        child: GestureDetector(
          onTap: () => Get.toNamed(tool.route),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Obx(
              () => Card(
                surfaceTintColor: cardColor.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        width: Get.width / 15,
                        height: Get.height / 10,
                        decoration: BoxDecoration(
                            color: Get.theme.hoverColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: Icon(tool.icon, size: 50)),
                    Container(
                      width: Get.width / 10,
                      height: Get.height / 5,
                      child: Column(
                        children: [
                          AutoSizeText(
                            tool.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Flexible(
                            child: AutoSizeText(tool.description,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
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
        ),
      ),
    );
  }
}
