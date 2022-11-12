import 'dart:convert';
import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:easy_localization/easy_localization.dart';

String formatJson(String json,
    {Indentation indentation = Indentation.fourSpaces,
    bool sortAlphabetically = false}) {
  dynamic object;

  try {
    json = applyWebSpaceFix(json);
    object = jsonDecode(json);
  } on FormatException catch (_) {
    return "invalid_json_data".tr();
  }
  if (object != null) {
    if (sortAlphabetically) object = sortJson(object);
    if (indentation != Indentation.compact) {
      return JsonEncoder.withIndent(indentation.toString()).convert(object);
    }
    return const JsonEncoder().convert(object);
  } else {
    return "";
  }
}

sortJson(json) {
  if (json is Map) {
    for (var entry in json.entries) {
      if (entry.value is List || entry.value is Map) {
        json[entry.key] = sortJson(entry);
      }
    }
    return _sortKeys(json);
  } else if (json is List) {
    for (var i = 0; i < json.length; i++) {
      final value = json[i];
      if (value is List || value is Map) json[i] = sortJson(value);
    }
    return json;
  } else if (json.value is Map) {
    for (final entry in json.value.entries) {
      if (entry.value is List || entry.value is Map) {
        json.value[entry.key] = sortJson(entry);
      }
    }
  } else if (json.value is List) {
    for (var i = 0; i < json.value.length; i++) {
      final value = json.value[i];
      if (value is List || value is Map) json.value[i] = sortJson(value);
    }
    return json.value;
  }

  return _sortKeys(json.value);
}

_sortKeys(Map map) => Map.fromEntries(
    map.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
