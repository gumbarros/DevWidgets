import 'package:dev_widgets/domain/helpers/text/text_escaper.dart' as escaper;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Text Escaper', () {
    const String unescapedText = """Gustavo Barros
    This is a test""";
    const String escapedText = "Gustavo Barros\\n    This is a test";
    test("Escape text", () {
      final String result = escaper.escape(unescapedText);

      expect(escapedText, result);
    });
    test("Unescape text", () {
      final String result = escaper.unescape(escapedText);

      expect(unescapedText, result);
    });
  });
}
