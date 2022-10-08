import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

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
      padding: EdgeInsets.only(top: 60, bottom: 40, right: 40, left: 40),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        width: context.layout.value(
                          xs: Get.width / 7,
                          sm: Get.width / 8,
                          md: Get.width / 10,
                          lg: Get.width / 15,
                          xl: Get.width / 20,
                        ),
                        height: context.layout.value(
                          xs: Get.height / 10,
                          sm: Get.height / 10,
                          md: Get.height / 10,
                          lg: Get.height / 10,
                          xl: Get.height / 12,
                        ),
                        decoration: BoxDecoration(
                            color: Get.theme.hoverColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                            child: FaIcon(
                          tool.icon,
                          size: 35,
                        ))),
                    Container(
                      width: context.layout.value(
                        xs: Get.width / 7,
                        sm: Get.width / 7,
                        md: Get.width / 7,
                        lg: Get.width / 15,
                        xl: Get.width / 20,
                      ),
                      height: context.layout.value(
                        xs: Get.height / 7,
                        sm: Get.height / 7,
                        md: Get.height / 7,
                        lg: Get.height / 7,
                        xl: Get.height / 12,
                      ),
                      child: Column(
                        children: [
                          AutoSizeText(
                            tool.homeTitle,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
