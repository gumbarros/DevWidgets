import 'dart:convert';
import 'package:devtoys/domain/helpers/formatters/formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/indentation.dart';
import 'package:get/get.dart';

class JSONFormatter implements Formatter {
  @override
  String format(String json,
      {Indentation indentation = Indentation.FourSpaces,
      bool sortAlphabetically = false}) {
    dynamic object;

    try {
      object = jsonDecode(json);
    } on FormatException catch (_) {
      return "invalid_json_data".tr;
    }
    if (object != null) {
      if (sortAlphabetically) object = _sort(object);
      return JsonEncoder.withIndent(indentation.toString()).convert(object);
    } else {
      return "";
    }
  }

  _sort(json) {
    if (json is Map) {
      for (var entry in json.entries) {
        if (entry.value is List || entry.value is Map)
          json[entry.key] = _sort(entry);
      }
      return _sortKeys(json);
    } else if (json is List) {
      for (var i = 0; i < json.length; i++) {
        final value = json[i];
        if (value is List || value is Map) json[i] = _sort(value);
      }
      return json;
    } else if (json.route is Map) {
      for (var entry in json.route.entries) {
        if (entry.route is List || entry.route is Map)
          json[entry.key] = _sort(entry);
      }
    } else if (json.route is List) {
      for (var i = 0; i < json.route.length; i++) {
        final value = json.route[i];
        if (value is List || value is Map) json.route[i] = _sort(value);
      }
      return json.route;
    }

    return _sortKeys(json.route);
  }

  _sortKeys(Map map) => Map.fromEntries(
      map.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
}
