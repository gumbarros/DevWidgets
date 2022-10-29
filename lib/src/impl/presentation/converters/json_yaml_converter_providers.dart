import 'package:dev_widgets/src/impl/domain/converters/json_yaml_converter.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:highlight/languages/json.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/models/tools/converters/json_yaml_conversion_type.dart';
import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
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

final inputControllerProvider = StateProvider<CodeController>((ref) {
  final conversionType = ref.watch(conversionTypeProvider);

  CodeController inputController;

  switch (conversionType) {
    case JsonYamlConversionType.yamlToJson:
      inputController = CodeController(language: yaml);
      break;
    case JsonYamlConversionType.jsonToYaml:
      inputController = CodeController(language: json);
      break;
  }

  inputController.addListener(() {
    String text = inputController.text;

    String result;
    if (conversionType == JsonYamlConversionType.jsonToYaml) {
      result = convertJsonToYaml(text);
    } else {
      result = convertYamlToJson(text,
          sortAlphabetically: ref.read(sortAlphabeticallyProvider),
          indentation: ref.read(indentationProvider));
    }

    ref.read(outputControllerProvider.notifier).state = CodeController(
        text: result,
        language:
            conversionType == JsonYamlConversionType.jsonToYaml ? yaml : json);
  });

  return inputController;
});

final outputControllerProvider = StateProvider<CodeController>((ref) {
  final conversionType = ref.watch(conversionTypeProvider);

  CodeController outputController;

  switch (conversionType) {
    case JsonYamlConversionType.yamlToJson:
      outputController = CodeController(language: json);
      break;
    case JsonYamlConversionType.jsonToYaml:
      outputController = CodeController(language: yaml);
      break;
  }

  return outputController;
});
