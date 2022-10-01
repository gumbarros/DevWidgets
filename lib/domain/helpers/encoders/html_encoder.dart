import 'dart:convert';

import 'package:devtoys/domain/helpers/encoders/encoder.dart';
import 'package:html_unescape/html_unescape_small.dart';

class HTMLEncoder implements Encoder {
  @override
  String decode(String content) {
    var unescape = HtmlUnescape();

    return unescape.convert(content);
  }

  @override
  String encode(String content) {
    const htmlEscape = HtmlEscape();
    return htmlEscape.convert(content);
  }
}
