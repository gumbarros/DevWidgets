import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';

class ToolCard extends StatelessWidget {
  final double xsWidth = Get.width / 2;
  final double xsHeight = Get.height / 3;

  final double smWidth = Get.width / 10;
  final double smHeight = Get.height / 10;

  final double mdWidth = Get.width / 10;
  final double mdHeight = Get.height / 5;

  final double lgWidth = Get.width / 12;
  final double lgHeight = Get.height / 8;

  final double xlWidth = Get.width / 18;
  final double xlHeight = Get.height / 10;

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
      padding: EdgeInsets.only(top: 60, bottom: 10, right: 40, left: 40),
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
                            xs: xsWidth,
                            sm: Get.width / 8,
                            md: mdWidth,
                            lg: xlWidth,
                            xl: xlWidth),
                        height: context.layout.value(
                            xs: xsHeight,
                            sm: Get.height / 8,
                            md: mdHeight,
                            lg: lgHeight,
                            xl: xlHeight),
                        decoration: BoxDecoration(
                            color: Get.theme.hoverColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                            child: FaIcon(
                          tool.icon,
                          size: 80,
                        ))),
                    Container(
                      width: context.layout.value(
                          xs: xsWidth,
                          sm: smWidth,
                          md: mdWidth,
                          lg: xlWidth,
                          xl: xlWidth),
                      height: context.layout.value(
                          xs: xsHeight,
                          sm: smWidth,
                          md: mdHeight,
                          lg: lgHeight,
                          xl: xlHeight),
                      child: Column(
                        children: [
                          AutoSizeText(
                            tool.title,
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
