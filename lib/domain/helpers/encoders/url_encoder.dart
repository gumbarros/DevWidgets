import 'package:dev_widgets/domain/helpers/encoders/encoder.dart';

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
