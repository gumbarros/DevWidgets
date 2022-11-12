import 'package:dev_widgets/src/impl/formatters/yaml_formatter/yaml_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json2yaml/json2yaml.dart';

final sortAlphabeticallyProvider = StateProvider<bool>((ref) {
  return false;
});

final yamlStyleProvider = StateProvider<YamlStyle>((ref) {
  return YamlStyle.generic;
});

final inputTextProvider = StateProvider<String>((ref) => "");

final outputTextProvider = StateProvider<String>((ref) => formatYaml(
    ref.watch(inputTextProvider),
    style: ref.watch(yamlStyleProvider),
    sortAlphabetically: ref.watch(sortAlphabeticallyProvider)));
