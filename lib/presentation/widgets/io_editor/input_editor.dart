import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:devtoys/presentation/widgets/io_editor/input_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputEditor extends StatelessWidget {
  const InputEditor({
    Key? key,
    this.inputChild,
    required this.inputController,
    this.width,
    this.height,
    this.toolbarTitle,
    this.isVerticalLayout = false,
    this.usesCodeControllers = true,
  }) : super(key: key);

  final Widget? inputChild;
  final TextEditingController? inputController;
  final bool isVerticalLayout;
  final String? toolbarTitle;
  final bool usesCodeControllers;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: inputChild == null,
      replacement: inputChild ?? SizedBox.shrink(),
      child: ListView(
        children: [
          inputController != null
              ? InputToolBar(
                  inputController: inputController!, toolbarTitle: toolbarTitle)
              : SizedBox.shrink(),
          Container(
              width: width ?? Get.width,
              margin: EdgeInsets.all(8.0),
              height: height ??
                  (isVerticalLayout ? Get.height / 3.5 : Get.height / 1.5),
              child: usesCodeControllers
                  ? CodeField(
                      wrap: true,
                      textStyle: TextStyle(
                          fontSize:
                              GlobalSettings.getTextEditorFontSize().value),
                      expands: true,
                      controller: (inputController ?? CodeController())
                          as CodeController,
                    )
                  : TextField(
                      maxLines: null,
                      style: TextStyle(
                          fontSize:
                              GlobalSettings.getTextEditorFontSize().value),
                      minLines: 10,
                      enabled: true,
                      controller: inputController,
                      keyboardType: TextInputType.multiline,
                    )),
        ],
      ),
    );
  }
}
