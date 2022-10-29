import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JSON Formatter', () {
    String input = "{\"name\":\"Gustavo\",\"age\":21}";
    test("Format JSON without sorting", () {
      String expectedResult = """
{
    "name": "Gustavo",
    "age": 21
}""";

      String result = formatJson(input);

      expect(expectedResult, result);
    });
    test("Format JSON sorting", () {
      String expectedResult = """
{
    "age": 21,
    "name": "Gustavo"
}""";

      String result = formatJson(input, sortAlphabetically: true);

      expect(expectedResult, result);
    });
  });
}
