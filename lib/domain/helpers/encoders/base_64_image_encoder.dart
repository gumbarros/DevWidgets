import 'dart:convert';

import 'package:dev_widgets/domain/helpers/encoders/encoder.dart';
import 'package:flutter/services.dart';

class Base64ImageEncoder implements Encoder {
  @override
  String encode(content) {
    return const Base64Encoder().convert(content);
  }

  @override
  Uint8List decode(content) {
    return const Base64Decoder().convert(content);
  }
}
