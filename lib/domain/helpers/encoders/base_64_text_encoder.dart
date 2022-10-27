import 'dart:convert';

import 'package:dev_widgets/domain/helpers/encoders/encoder.dart';
import 'package:dev_widgets/src/models/tools/encoders/base64_encoding_type.dart';

class Base64TextEncoder implements Encoder {
  @override
  String decode(content,
      {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
    final bytes = base64.decode(content);

    return encodingType == Base64EncodingType.ascii
        ? ascii.decoder.convert(bytes)
        : utf8.decode(bytes);
  }

  @override
  String encode(content,
      {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
    final bytes = encodingType == Base64EncodingType.ascii
        ? ascii.encoder.convert(content)
        : utf8.encode(content);

    return base64.encode(bytes);
  }
}
