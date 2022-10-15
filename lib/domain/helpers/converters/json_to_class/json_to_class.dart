import 'dart:convert';
import 'package:devtoys/domain/helpers/converters/json_to_class/json_to_class_provider.dart';
import 'package:devtoys/domain/helpers/converters/json_to_class/json_to_dart_provider.dart';
import 'package:devtoys/domain/models/tools/converters/programming_language.dart';
import 'package:get/get.dart';

class JsonToClass {
  String convert(String data,
      {required String className, required ProgrammingLanguage language}) {
    try {
      json.decode(data) as Map<String, dynamic>;

      var provider = getProvider(language);

      return provider.convert(className, data);
    } on FormatException catch (_) {
      return "invalid_json_data".tr;
    }
  }

  JsonToClassProvider getProvider(ProgrammingLanguage language) {
    switch (language) {
      case ProgrammingLanguage.dart:
        return JsonToDartProvider();
    }
  }
}
