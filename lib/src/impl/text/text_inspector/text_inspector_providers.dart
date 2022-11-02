import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_case_convertion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';


final selectedCaseConvertionProvider =
    StateProvider<CaseConvertion>((ref) => CaseConvertion.originalText);

final originalTextProvider = StateProvider<String>((ref)=>"");

final inputTextProvider = StateProvider<String>((ref)=>"");

class TextConverter extends Notifier<String> {
  @override
  String build() => "";

  void convert(CaseConvertion convertion) {
    String input = ref.read(inputTextProvider);

    if(convertion != CaseConvertion.originalText) {
      ref.read(originalTextProvider.notifier).state = input;
    }

    final reCase = ReCase(input);

    switch(convertion){
      case CaseConvertion.originalText:
        state = ref.read(originalTextProvider);
        break;
      case CaseConvertion.sentenceCase:
        state = reCase.sentenceCase;
        break;
      case CaseConvertion.lowerCase:
        state = input.toLowerCase();
        break;
      case CaseConvertion.upperCase:
        state = input.toUpperCase();
        break;
      case CaseConvertion.constantCase:
        state = reCase.constantCase;
        break;
      case CaseConvertion.pascalCase:
        state = reCase.pascalCase;
        break;
      case CaseConvertion.headerCase:
        state = reCase.headerCase;
        break;
      case CaseConvertion.titleCase:
        state = reCase.titleCase;
        break;
      case CaseConvertion.camelCase:
        state = reCase.camelCase;
        break;
      case CaseConvertion.pathCase:
        state = reCase.pathCase;
        break;
      case CaseConvertion.dotCase:
        state = reCase.dotCase;
        break;
      case CaseConvertion.snakeCase:
        state = reCase.snakeCase;
        break;
      case CaseConvertion.paramCase:
       state = reCase.paramCase;
        break;
    }
  }
}

final textConverterProvider = NotifierProvider<TextConverter, String>(TextConverter.new);