import 'package:dev_widgets/src/impl/widgets/io_editor/code_editor_wrapper.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/input_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputEditor extends StatelessWidget {
  const InputEditor(
      {Key? key,
      this.inputChild,
      this.inputController,
      this.width,
      this.height,
      this.onChanged,
      this.toolbarTitle,
      this.isVerticalLayout = false,
      this.usesCodeControllers = true})
      : super(key: key);

  final Widget? inputChild;
  final TextEditingController? inputController;
  final bool isVerticalLayout;
  final String? toolbarTitle;
  final bool usesCodeControllers;
  final double? width;
  final Function(String)? onChanged;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: inputChild == null,
      replacement: inputChild ?? const SizedBox.shrink(),
      child: ListView(
        children: [
          inputController != null
              ? InputToolBar(
                  inputController: inputController!, toolbarTitle: toolbarTitle)
              : const SizedBox.shrink(),
          Container(
            width: width ?? Get.width,
            margin: const EdgeInsets.all(8.0),
            height: height ??
                (isVerticalLayout ? Get.height / 3.5 : Get.height / 1.5),
            child: CodeEditorWrapper(
                onChanged: onChanged,
                usesCodeControllers: usesCodeControllers,
                textEditingController: inputController),
          )
        ],
      ),
    );
  }
}
