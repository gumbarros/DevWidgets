import 'package:dev_widgets/src/text/text_escape/text_escape.dart' as escape;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Text Escaper', () {
    const String unescapedText = """Gustavo Barros
    This is a test""";
    const String escapedText = "Gustavo Barros\\n    This is a test";
    test("Escape text", () {
      final String result = escape.escape(unescapedText);

      expect(escapedText, result);
    });
    test("Unescape text", () {
      final String result = escape.unescape(escapedText);

      expect(unescapedText, result);
    });
  });
}
