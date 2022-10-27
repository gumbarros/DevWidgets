import 'package:code_text_field/code_text_field.dart';

class CodeControllerFactory {
  static CodeController getInstance(
          {required language, bool useWebFix = true}) =>
      CodeController(language: language, webSpaceFix: useWebFix);
}
