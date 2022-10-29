import 'package:dev_widgets/src/impl/encoders/html/html_encoder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HTML Encoder', () {
    test("Encode HTML", () {
      String input = "<h1>test</h1>";
      String expectedResult = "&lt;h1&gt;test&lt;&#47;h1&gt;";

      String result = encodeHtml(input);

      expect(expectedResult, result);
    });
    test("Decode HTML", () {
      String input = "&lt;h1&gt;test&lt;&#47;h1&gt;";
      String expectedResult = "<h1>test</h1>";

      String result = decodeHtml(input);

      expect(expectedResult, result);
    });
  });
}
