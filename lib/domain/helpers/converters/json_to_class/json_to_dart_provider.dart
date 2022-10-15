import 'package:devtoys/domain/helpers/converters/json_to_class/json_to_class_provider.dart';
import 'package:json_to_dart/json_to_dart.dart';

class JsonToDartProvider implements JsonToClassProvider {
  @override
  String convert(String className, String jsonData) {
    var generator = ModelGenerator(className);

    return generator.generateDartClasses(jsonData).code;
  }
}
