import 'dart:convert';

import 'package:devtoys/domain/helpers/encoders/encoder.dart';
import 'package:html_unescape/html_unescape_small.dart';

class HTMLEncoder implements Encoder {
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
