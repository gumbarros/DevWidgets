import 'dart:convert';
import 'package:html_unescape/html_unescape_small.dart';

String encodeHtml(content) {
  var unescape = HtmlUnescape();

  return unescape.convert(content);
}

@override
String decodeHtml(content) {
  const htmlEscape = HtmlEscape();
  return htmlEscape.convert(content);
}
