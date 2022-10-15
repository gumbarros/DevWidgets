import 'package:devtoys/domain/helpers/encoders/encoder.dart';

class URLEncoder implements Encoder {
  @override
  String decode(content) {
    return Uri.decodeComponent(content);
  }

  @override
  String encode(content) {
    return Uri.encodeComponent(content);
  }
}
