import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru_colors/yaru_colors.dart';

class ToolCard extends StatefulWidget {
  final Tool tool;

  ToolCard(this.tool);

  @override
  State<ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
  Color cardColor = Colors.transparent;

  void onHoverIn(PointerEvent _) {
    setState(() {
      cardColor = Color.fromARGB(99, 132, 132, 132);
      // cardColor = YaruColors.coolGrey; not using this as its the same as the background color.
    });
  }

  void onHoverOut(PointerEvent _) {
    setState(() {
      cardColor = Colors.transparent;
    });
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
          onTap: () => Get.toNamed(widget.tool.route),
          child: Container(
            // margin: EdgeInsets.only(right: 50, left: 50, top: 15, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Card(
              surfaceTintColor: cardColor,
              // color: Color.fromRGBO(53, 53, 53, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(widget.tool.icon, size: 75),
                  SizedBox(height: 10),
                  AutoSizeText(
                    widget.tool.name,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    child: AutoSizeText(widget.tool.description,
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
    );
  }
}
