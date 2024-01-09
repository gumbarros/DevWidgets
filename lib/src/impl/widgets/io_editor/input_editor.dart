import 'package:dev_widgets/src/impl/widgets/io_editor/code_editor_wrapper.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/input_toolbar.dart';
import 'package:flutter/material.dart';

class InputEditor extends StatelessWidget {
  const InputEditor(
      {super.key,
      this.inputChild,
      this.inputController,
      this.width,
      this.height,
      this.toolbarTitle,
      this.minLines = 10,
      this.isVerticalLayout = false,
      this.usesCodeControllers = true,
      this.onChanged});

  final Widget? inputChild;
  final TextEditingController? inputController;
  final bool isVerticalLayout;
  final String? toolbarTitle;
  final bool usesCodeControllers;
  final double? width;
  final Function(String value)? onChanged;
  final double? height;
  final int? minLines;

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
            width: width ?? MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8.0),
            height: height ??
                (isVerticalLayout
                    ? MediaQuery.of(context).size.height / 3.5
                    : MediaQuery.of(context).size.height / 1.5),
            child: CodeEditorWrapper(
                onChanged: onChanged,
                minLines: minLines,
                usesCodeControllers: usesCodeControllers,
                textEditingController: inputController),
          )
        ],
      ),
    );
  }
}
