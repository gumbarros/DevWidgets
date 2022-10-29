import 'dart:convert';
import 'package:html_unescape/html_unescape_small.dart';

String decodeHtml(content) {
  var unescape = HtmlUnescape();

  return unescape.convert(content);
}

@override
String encodeHtml(content) {
  const htmlEscape = HtmlEscape();
  return htmlEscape.convert(content);
}
