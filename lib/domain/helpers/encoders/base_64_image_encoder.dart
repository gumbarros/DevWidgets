import 'dart:convert';

import 'package:devtoys/domain/helpers/encoders/encoder.dart';
import 'package:flutter/services.dart';

class Base64ImageEncoder implements Encoder {
  @override
  String encode(content) {
    return Base64Encoder().convert(content);
  }

  @override
  Uint8List decode(content) {
    return Base64Decoder().convert(content);
  }
}
