import 'dart:convert';

import 'package:devtoys/domain/helpers/encoders/encoder.dart';

class Base64TextEncoder implements Encoder {
  @override
  String decode(String content) {
    final bytes = base64.decode(content);

    return utf8.decode(bytes);
  }

  @override
  String encode(String content) {
    final bytes = utf8.encode(content);

    return base64.encode(bytes);
  }
}
