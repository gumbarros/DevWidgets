import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeEditorWrapper extends ConsumerWidget {
  final TextEditingController? textEditingController;
  final bool usesCodeControllers;
  final bool readOnly;
  final Function(String value)? onChanged;
  final int? minLines;
  const CodeEditorWrapper(
      {super.key,
      required this.usesCodeControllers,
      this.textEditingController,
      this.onChanged,
      this.minLines = 10,
      this.readOnly = false});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsProvider);

    if (usesCodeControllers) {
      return CodeTheme(
        data:
            CodeThemeData(styles: textEditorThemes[settings.textEditorTheme]!),
        child: CodeField(
          cursorColor: Theme.of(context).focusColor,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          lineNumberStyle:
              LineNumberStyle(textStyle: Theme.of(context).textTheme.bodySmall),
          wrap: settings.textEditorWrap,
          lineNumbers: settings.textEditorDisplayLineNumbers,
          textStyle: TextStyle(
              fontFamily: settings.textEditorFontFamily,
              fontSize: settings.textEditorFontSize,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              inherit: false,
              textBaseline: TextBaseline.alphabetic),
          readOnly: readOnly,
          expands: true,
          onChanged: onChanged,
          controller:
              (textEditingController ?? CodeController()) as CodeController,
        ),
      );
    } else {
      return TextFormField(
        maxLines: settings.textEditorWrap ? null : minLines,
        style: TextStyle(
            fontFamily: settings.textEditorFontFamily,
            fontSize: settings.textEditorFontSize,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            inherit: false,
            textBaseline: TextBaseline.alphabetic),
        minLines: minLines,
        enabled: true,
        controller: textEditingController ?? TextEditingController(),
        onChanged: onChanged,
        keyboardType: TextInputType.multiline,
      );
    }
  }
}
