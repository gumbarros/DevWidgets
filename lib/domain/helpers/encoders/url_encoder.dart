import 'package:devtoys/domain/helpers/encoders/encoder.dart';

class URLEncoder implements Encoder {
  @override
  String decode(String content) {
    return Uri.decodeComponent(content);
  }

  @override
  String encode(String content) {
    return Uri.encodeComponent(content);
  }
}
