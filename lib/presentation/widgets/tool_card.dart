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
      padding: EdgeInsets.only(right: 50, left: 50, top: 15, bottom: 15),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(tool.icon, size: 75),
                    SizedBox(height: 10),
                    AutoSizeText(
                      tool.name,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: AutoSizeText(tool.description,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade),
                    ),
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
