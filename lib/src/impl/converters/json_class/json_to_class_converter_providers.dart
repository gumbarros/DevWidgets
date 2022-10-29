import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/converters/json_class/json_to_class_converter.dart';
import 'package:dev_widgets/src/impl/converters/json_class/programming_language.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/json.dart';

final programmingLanguageProvider = StateProvider<ProgrammingLanguage>((ref) {
  return ProgrammingLanguage.dart;
});

final classNameProvider = StateProvider<String>((ref) {
  return "MyClass";
});

final inputControllerProvider = StateProvider<CodeController>((ref) {
  final inputController = CodeController(language: json);

  inputController.addListener(() {
    String result = convertJsonToClass(inputController.text,
        className: ref.read(classNameProvider),
        language: ProgrammingLanguage.dart);

    ref.read(outputControllerProvider.notifier).state =
        CodeController(text: result, language: dart);
  });

  return inputController;
});

final outputControllerProvider =
    StateProvider<CodeController>((ref) => CodeController(language: dart));
