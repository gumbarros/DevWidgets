import 'package:code_text_field/code_text_field.dart';
import 'package:devtoys/presentation/widgets/io_editor/input_toolbar.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resizable_widget/resizable_widget.dart';

class IOEditor extends StatelessWidget {
  final bool usesCodeControllers;
  final TextEditingController? inputController;
  final TextEditingController? outputController;
  final Widget? outputChild;
  final Widget? inputChild;

  ///When set to true, creates horizontal separators.
  final bool isVerticalLayout;

  IOEditor(
      {super.key,
      this.usesCodeControllers = true,
      this.inputController,
      this.outputController,
      this.isVerticalLayout = false,
      this.outputChild,
      this.inputChild});

  @override
  Widget build(BuildContext context) {
    return ResizableWidget(
      isDisabledSmartHide: true,
      isHorizontalSeparator: isVerticalLayout,
      children: [
        Visibility(
          visible: inputChild == null,
          replacement: inputChild ?? SizedBox.shrink(),
          child: Column(
            children: [
              inputController != null
                  ? InputToolBar(inputController: inputController!)
                  : SizedBox.shrink(),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.all(8.0),
                  height:
                      isVerticalLayout ? Get.height / 3.5 : Get.height / 1.5,
                  child: Visibility(
                    visible: usesCodeControllers,
                    child: CodeField(
                      wrap: true,
                      expands: true,
                      controller: (inputController ?? CodeController())
                          as CodeController,
                    ),
                    replacement: TextField(
                      maxLines: null,
                      minLines: 10,
                      enabled: false,
                      controller: inputController,
                      keyboardType: TextInputType.multiline,
                    ),
                  )),
            ],
          ),
        ),
        Visibility(
          visible: outputChild == null,
          replacement: outputChild ?? SizedBox.shrink(),
          child: Column(
            children: [
              outputController != null
                  ? OutputToolbar(outputController: outputController!)
                  : SizedBox.shrink(),
              Container(
                  width: isVerticalLayout ? Get.width : Get.width / 1.5,
                  margin: EdgeInsets.all(8.0),
                  height:
                      isVerticalLayout ? Get.height / 3.5 : Get.height / 1.5,
                  child: Visibility(
                    visible: usesCodeControllers,
                    child: CodeField(
                      wrap: true,
                      expands: true,
                      controller: (outputController ?? CodeController())
                          as CodeController,
                    ),
                    replacement: TextField(
                      maxLines: null,
                      minLines: 10,
                      controller: outputController,
                      keyboardType: TextInputType.multiline,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
