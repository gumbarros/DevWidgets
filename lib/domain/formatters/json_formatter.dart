import 'dart:convert';

import 'package:devtoys/domain/formatters/formatter.dart';
import 'package:devtoys/domain/formatters/indentation.dart';

class JSONFormatter implements Formatter {
  @override
  String format(String json,
      {Indentation indentation = Indentation.FourSpaces, bool sort = false}) {
    final object = jsonDecode(json);
    return JsonEncoder.withIndent(indentation.toString()).convert(object);
  }
}
