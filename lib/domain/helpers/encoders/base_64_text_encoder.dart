import 'dart:convert';

import 'package:devtoys/domain/helpers/encoders/encoder.dart';
import 'package:devtoys/domain/models/tools/encoders/base64_encoding_type.dart';

class Base64TextEncoder implements Encoder {
  @override
  String decode(String content,
      {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
    final bytes = base64.decode(content);

    return encodingType == Base64EncodingType.ascii
        ? ascii.decoder.convert(bytes)
        : utf8.decode(bytes);
  }

  @override
  String encode(String content,
      {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
    final bytes = encodingType == Base64EncodingType.ascii
        ? ascii.encoder.convert(content)
        : utf8.encode(content);

    return base64.encode(bytes);
  }
}
