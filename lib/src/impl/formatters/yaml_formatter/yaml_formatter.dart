import 'package:dev_widgets/src/impl/converters/json_yaml/json_yaml_converter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:json2yaml/json2yaml.dart';

String formatYaml(String yaml,
    {YamlStyle style = YamlStyle.generic, bool sortAlphabetically = false}) {
  try {
    final json = convertYamlToJson(yaml, sortAlphabetically: false);
    return convertJsonToYaml(json,
        yamlStyle: style, sortAlphabetically: sortAlphabetically);
  } catch (_) {
    return "invalid_yaml_data".tr();
  }
}
