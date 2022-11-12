import 'dart:convert';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter.dart';
import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:yaml/yaml.dart';

String convertJsonToYaml(String text,
    {required YamlStyle yamlStyle, required bool sortAlphabetically}) {
  text = applyWebSpaceFix(text);

  try {
    var json = jsonDecode(text);
    if (sortAlphabetically) {
      json = sortJson(json);
      json = jsonDecode(const JsonEncoder().convert(json));
    }
    return json2yaml(json, yamlStyle: yamlStyle);
  } on FormatException catch (_) {
    return "invalid_data".tr();
  }
}

String convertYamlToJson(String text,
    {Indentation? indentation, required bool sortAlphabetically}) {
  text = applyWebSpaceFix(text);

  try {
    final yaml = loadYaml(text);

    return formatJson(jsonEncode(yaml),
        indentation: indentation ?? Indentation.fourSpaces,
        sortAlphabetically: sortAlphabetically);
  } on YamlException catch (_) {
    return "invalid_yaml_data".tr();
  }
}
