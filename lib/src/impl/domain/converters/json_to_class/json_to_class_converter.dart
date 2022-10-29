import 'dart:convert';
import 'package:dev_widgets/src/impl/domain/converters/json_to_class/json_to_class_provider.dart';
import 'package:dev_widgets/src/impl/domain/converters/json_to_class/json_to_dart_provider.dart';
import 'package:dev_widgets/src/models/tools/converters/programming_language.dart';
import 'package:dev_widgets/src/impl/presentation/helpers.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToClassConverter {
  String convert(String data,
      {required String className, required ProgrammingLanguage language}) {
    try {
      data = applyWebSpaceFix(data);
      json.decode(data) as Map<String, dynamic>;

      var provider = getProvider(language);

      return provider.convert(className, data);
    } on FormatException catch (_) {
      return "invalid_json_data".tr();
    }
  }

  JsonToClassProvider getProvider(ProgrammingLanguage language) {
    switch (language) {
      case ProgrammingLanguage.dart:
        return JsonToDartProvider();
    }
  }
}
