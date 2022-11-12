import 'package:dev_widgets/src/impl/converters/json_yaml/json_yaml_conversion_type.dart';
import 'package:dev_widgets/src/impl/converters/json_yaml/json_yaml_converter.dart';
import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
  return false;
});

final conversionTypeProvider = StateProvider<JsonYamlConversionType>((ref) {
  return JsonYamlConversionType.jsonToYaml;
});

final indentationProvider = StateProvider<Indentation>((ref) {
  return Indentation.fourSpaces;
});

final inputTextProvider = StateProvider<String>((ref) => "");

final outputTextProvider = StateProvider((ref) {
  final text = ref.watch(inputTextProvider);
  final conversionType = ref.watch(conversionTypeProvider);

  String result;
  if (conversionType == JsonYamlConversionType.jsonToYaml) {
    result = convertJsonToYaml(text);
  } else {
    result = convertYamlToJson(text,
        sortAlphabetically: ref.watch(sortAlphabeticallyProvider),
        indentation: ref.watch(indentationProvider));
  }

  return result;
});
