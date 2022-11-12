import 'package:dev_widgets/src/impl/converters/json_to_class/json_to_class_converter.dart';
import 'package:dev_widgets/src/impl/converters/json_to_class/programming_language.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programmingLanguageProvider = StateProvider<ProgrammingLanguage>((ref) {
  return ProgrammingLanguage.dart;
});

final classNameProvider = StateProvider<String>((ref) {
  return "MyClass";
});

final inputTextProvider = StateProvider<String>((ref) {
  return "";
});

final outputTextProvider = StateProvider<String>((ref) {
  final inputText = ref.watch(inputTextProvider);

  String result = convertJsonToClass(inputText,
      className: ref.watch(classNameProvider),
      language: ProgrammingLanguage.dart);

  return result;
});
