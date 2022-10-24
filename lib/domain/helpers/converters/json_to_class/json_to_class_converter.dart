import 'dart:convert';
import 'package:dev_widgets/domain/helpers/converters/json_to_class/json_to_class_provider.dart';
import 'package:dev_widgets/domain/helpers/converters/json_to_class/json_to_dart_provider.dart';
import 'package:dev_widgets/domain/models/tools/converters/programming_language.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:get/get.dart';

class JsonToClassConverter {
  String convert(String data,
      {required String className, required ProgrammingLanguage language}) {
    try {
      data = applyWebSpaceFix(data);
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
