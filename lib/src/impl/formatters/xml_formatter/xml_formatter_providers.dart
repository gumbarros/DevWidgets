import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/formatters/xml_formatter/xml_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/xml.dart';

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});

final outputTextProvider = StateProvider<String>((ref) => "");

final inputControllerProvider = StateProvider<CodeController>((ref) {
  final inputController = CodeController(language: xml);

  inputController.addListener(() {
    Indentation indentation = ref.read(indentationProvider);

    try {
      ref.read(outputTextProvider.notifier).state =
          formatXml(inputController.text, indentation: indentation);
    } catch (_) {
      //Bug on code_text_field package.
    }
  });

  return inputController;
});
