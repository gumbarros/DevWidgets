import 'dart:convert';

import 'package:dev_widgets/src/impl/converters/json_to_class/programming_language.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:json_dart_generator/json_dart_generator.dart';

abstract class _JsonToClassProvider {
  String convert(String className, String jsonData);
}

class _JsonToDartConverter implements _JsonToClassProvider {
  @override
  String convert(String className, String jsonData) {
    var generator = DartCodeGenerator(rootClassName: className);

    return generator.generate(jsonData);
  }
}

String convertJsonToClass(String data,
    {required String className, required ProgrammingLanguage language}) {
  try {
    data = applyWebSpaceFix(data);
    json.decode(data) as Map<String, dynamic>;

    var provider = _getProvider(language);

    return provider.convert(className, data);
  } on FormatException catch (_) {
    return "invalid_json_data".tr();
  }
}

_JsonToClassProvider _getProvider(ProgrammingLanguage language) {
  switch (language) {
    case ProgrammingLanguage.dart:
      return _JsonToDartConverter();
  }
}
