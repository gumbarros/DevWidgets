import 'dart:convert';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_encoding_type.dart';

String decodeBase64(content,
    {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
  final bytes = base64.decode(content);

  return encodingType == Base64EncodingType.ascii
      ? ascii.decoder.convert(bytes)
      : utf8.decode(bytes);
}

String encodeBase64(content,
    {Base64EncodingType? encodingType = Base64EncodingType.ascii}) {
  final bytes = encodingType == Base64EncodingType.ascii
      ? ascii.encoder.convert(content)
      : utf8.encode(content);

  return base64.encode(bytes);
}
