import 'package:devtoys/presentation/widgets/io_editor/input_editor.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
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
      isHorizontalSeparator: isVerticalLayout,
      children: [
        InputEditor(
            inputChild: inputChild,
            inputController: inputController,
            isVerticalLayout: isVerticalLayout,
            usesCodeControllers: usesCodeControllers),
        OutputEditor(
            outputChild: outputChild,
            outputController: outputController,
            isVerticalLayout: isVerticalLayout,
            usesCodeControllers: usesCodeControllers)
      ],
    );
  }
}
