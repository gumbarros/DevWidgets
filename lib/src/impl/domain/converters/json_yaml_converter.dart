import 'dart:convert';
import 'package:dev_widgets/src/impl/domain/formatters/json_formatter.dart';
import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/presentation/helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

String convertJsonToYaml(String text) {
  text = applyWebSpaceFix(text);

  try {
    final json = jsonDecode(text);
    return json2yaml(json);
  } on FormatException catch (_) {
    return "invalid_json_data".tr();
  }
}

String convertYamlToJson(String text,
    {Indentation? indentation, required bool sortAlphabetically}) {
  text = applyWebSpaceFix(text);

  try {
    final yaml = loadYaml(text);
    final formatter = JsonFormatter();

    return formatter.format(jsonEncode(yaml),
        indentation: indentation!, sortAlphabetically: sortAlphabetically);
  } on YamlException catch (_) {
    return "invalid_yaml_data".tr();
  }
}