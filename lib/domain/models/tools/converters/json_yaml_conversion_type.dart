import 'package:devtoys/domain/models/described_enum.dart';

enum JsonYamlConversionType implements DescribedEnum {
  yamlToJson("YAML to JSON"),
  jsonToYaml("JSON to YAML");

  @override
  final String description;
  const JsonYamlConversionType(this.description);
}
