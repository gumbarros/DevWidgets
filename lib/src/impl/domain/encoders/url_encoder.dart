import 'package:dev_widgets/src/impl/domain/encoders/encoder.dart';

class UrlEncoder implements Encoder {
  @override
  String decode(content) {
    return Uri.decodeComponent(content);
  }

  @override
  String encode(content) {
    return Uri.encodeComponent(content);
  }
}
