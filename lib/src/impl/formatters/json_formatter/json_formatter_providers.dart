import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/json.dart';

final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
  return false;
});

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});

final outputTextProvider = StateProvider<String>((ref) => "");

final inputControllerProvider = StateProvider.autoDispose<CodeController>((ref) {
  final inputController = CodeController(language: json);

  inputController.addListener(() {
    bool sortAlphabetically = ref.read(sortAlphabeticallyProvider);
    Indentation indentation = ref.read(indentationProvider);

    try {
      ref.read(outputTextProvider.notifier).state = formatJson(
          inputController.text,
          indentation: indentation,
          sortAlphabetically: sortAlphabetically);
    } catch (_) {
      //Bug on code_text_field package.
    }
  });

  return inputController;
});
