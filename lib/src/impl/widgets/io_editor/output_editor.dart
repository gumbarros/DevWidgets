import 'package:dev_widgets/src/impl/widgets/io_editor/code_editor_wrapper.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/output_toolbar.dart';
import 'package:flutter/material.dart';

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
    assert(outputChild == null || actionButtons == null,
        "You cannot have both outputChild and actionButtons.");

    return Visibility(
      visible: outputChild == null,
      replacement: outputChild ?? const SizedBox.shrink(),
      child: ListView(
        children: [
          outputController != null
              ? OutputToolbar(
                  outputController: outputController!,
                  toolbarTitle: toolbarTitle,
                  actionButtons: actionButtons,
                )
              : const SizedBox.shrink(),
          Container(
            width: isVerticalLayout
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 1.5,
            margin: const EdgeInsets.all(8.0),
            height: isVerticalLayout
                ? MediaQuery.of(context).size.height / 3.5
                : MediaQuery.of(context).size.height / 1.5,
            child: CodeEditorWrapper(
                usesCodeControllers: usesCodeControllers,
                readOnly: true,
                textEditingController: outputController),
          )
        ],
      ),
    );
  }
}
