import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/io_text_style.dart';
import 'package:flutter/material.dart';

class CodeEditorWrapper extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool usesCodeControllers;
  final bool readOnly;
  const CodeEditorWrapper(
      {super.key,
      required this.usesCodeControllers,
      required this.textEditingController,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return usesCodeControllers
        ? CodeField(
            wrap: true,
            textStyle: getTextStyleFromSettings(),
            readOnly: readOnly,
            expands: true,
            controller:
                (textEditingController ?? CodeController()) as CodeController,
          )
        : TextField(
            maxLines: null,
            style: getTextStyleFromSettings(),
            minLines: 10,
            enabled: true,
            controller: textEditingController,
            keyboardType: TextInputType.multiline,
          );
  }
}
