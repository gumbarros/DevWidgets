import 'dart:convert';

import 'package:dev_widgets/domain/helpers/encoders/encoder.dart';
import 'package:html_unescape/html_unescape_small.dart';

class HtmlEncoder implements Encoder {
  @override
  String decode(content) {
    var unescape = HtmlUnescape();

    return unescape.convert(content);
  }

  @override
  String encode(content) {
    const htmlEscape = HtmlEscape();
    return htmlEscape.convert(content);
  }
}
