import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/themes.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeEditorWrapper extends ConsumerWidget {
  final TextEditingController? textEditingController;
  final bool usesCodeControllers;
  final bool readOnly;

  const CodeEditorWrapper(
      {super.key,
      required this.usesCodeControllers,
      required this.textEditingController,
      this.readOnly = false});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    if (usesCodeControllers) {
      return CodeTheme(
        data:
            CodeThemeData(styles: textEditorThemes[settings.textEditorTheme]!),
        child: CodeField(
          wrap: true,
          textStyle: TextStyle(
              fontFamily: settings.textEditorFontFamily,
              fontSize: settings.textEditorFontSize,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              inherit: false,
              textBaseline: TextBaseline.alphabetic),
          readOnly: readOnly,
          expands: true,
          controller:
              (textEditingController ?? CodeController()) as CodeController,
        ),
      );
    } else {
      return TextField(
        maxLines: null,
        style: TextStyle(
            fontFamily: settings.textEditorFontFamily,
            fontSize: settings.textEditorFontSize,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            inherit: false,
            textBaseline: TextBaseline.alphabetic),
        minLines: 10,
        enabled: true,
        controller: textEditingController,
        keyboardType: TextInputType.multiline,
      );
    }
  }
}
