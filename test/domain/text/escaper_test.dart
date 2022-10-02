import 'package:devtoys/domain/helpers/text/text_escaper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Text Escaper', () {
    var escaper = TextEscaper();
    const String unescapedText = """Gustavo Barros
    This is a test""";
    const String escapedText = "Gustavo Barros\\n    This is a test";
    test("Escape text", () {
      String result = escaper.escape(unescapedText);

      expect(escapedText, result);
    });
    test("Unescape text", () {
      String result = escaper.unescape(escapedText);

      expect(unescapedText, result);
    });
  });
}
