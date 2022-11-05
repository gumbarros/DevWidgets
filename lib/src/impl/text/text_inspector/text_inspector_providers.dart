import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_case_convertion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

final selectedCaseConvertionProvider =
    StateProvider<CaseConvertion>((ref) => CaseConvertion.originalText);

final convertedCaseProvider = StateProvider<String>((ref) => "");

final originalTextProvider = StateProvider<String>((ref) => "");

final inputTextProvider = StateProvider<String>((ref) => "");

final selectionOffsetProvider = StateProvider<int>((ref) => 0);

final charactersCountProvider = StateProvider<int>((ref) => 0);

final paragraphCountProvider = StateProvider<int>((ref) => 0);

final lineCountProvider = StateProvider<int>((ref) => 1);

final wordCountProvider = StateProvider<int>((ref) => 0);

final sentenceCountProvider = StateProvider<int>((ref) => 0);

final bytesCountProvider = StateProvider<int>((ref) => 0);

final wordDistributionProvider = StateProvider<Map<String?, int>>((ref) => {});

convertCase(WidgetRef ref, CaseConvertion caseConvertion) {
  String input = ref.read(inputTextProvider);

  if (caseConvertion != CaseConvertion.originalText) {
    ref.read(originalTextProvider.notifier).state = input;
  }

  final reCase = ReCase(input);

  String result;

  switch (caseConvertion) {
    case CaseConvertion.originalText:
      result = ref.read(originalTextProvider);
      break;
    case CaseConvertion.sentenceCase:
      result = reCase.sentenceCase;
      break;
    case CaseConvertion.lowerCase:
      result = input.toLowerCase();
      break;
    case CaseConvertion.upperCase:
      result = input.toUpperCase();
      break;
    case CaseConvertion.constantCase:
      result = reCase.constantCase;
      break;
    case CaseConvertion.pascalCase:
      result = reCase.pascalCase;
      break;
    case CaseConvertion.headerCase:
      result = reCase.headerCase;
      break;
    case CaseConvertion.titleCase:
      result = reCase.titleCase;
      break;
    case CaseConvertion.camelCase:
      result = reCase.camelCase;
      break;
    case CaseConvertion.pathCase:
      result = reCase.pathCase;
      break;
    case CaseConvertion.dotCase:
      result = reCase.dotCase;
      break;
    case CaseConvertion.snakeCase:
      result = reCase.snakeCase;
      break;
    case CaseConvertion.paramCase:
      result = reCase.paramCase;
      break;
  }
  ref.read(selectedCaseConvertionProvider.notifier).state = caseConvertion;
  ref.read(convertedCaseProvider.notifier).state = result;
}
