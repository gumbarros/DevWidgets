import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_text_style.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutputEditor extends StatelessWidget {
  const OutputEditor({
    Key? key,
    this.outputChild,
    required this.outputController,
    this.isVerticalLayout = false,
    this.toolbarTitle,
    this.actionButtons,
    this.usesCodeControllers = false,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget? outputChild;
  final TextEditingController? outputController;
  final bool isVerticalLayout;
  final String? toolbarTitle;
  final List<Widget>? actionButtons;
  final bool usesCodeControllers;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: outputChild == null,
      replacement: outputChild ?? SizedBox.shrink(),
      child: ListView(
        children: [
          outputController != null
              ? OutputToolbar(
                  outputController: outputController!,
                  toolbarTitle: toolbarTitle,
                  actionButtons: actionButtons,
                )
              : SizedBox.shrink(),
          Container(
              width: isVerticalLayout ? Get.width : Get.width / 1.5,
              margin: EdgeInsets.all(8.0),
              height: isVerticalLayout ? Get.height / 3.5 : Get.height / 1.5,
              child: usesCodeControllers
                  ? CodeField(
                      wrap: true,
                      expands: true,
                      //ReadOnly is not in this version of code_field
                      //Check https://github.com/BertrandBev/code_field/issues/67
                      textStyle: getTextStyleFromSettings(),
                      controller: (outputController ?? CodeController())
                          as CodeController,
                    )
                  : TextField(
                      maxLines: null,
                      style: getTextStyleFromSettings(),
                      minLines: 10,
                      readOnly: true,
                      controller: outputController,
                      keyboardType: TextInputType.multiline,
                    )),
        ],
      ),
    );
  }
}
