import 'package:dev_widgets/src/impl/domain/formatters/json_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JSON Formatter', () {
    var formatter = JsonFormatter();
    String input = "{\"name\":\"Gustavo\",\"age\":21}";
    test("Format JSON without sorting", () {
      String expectedResult = """
{
    "name": "Gustavo",
    "age": 21
}""";

      String result = formatter.format(input);

      expect(expectedResult, result);
    });
    test("Format JSON sorting", () {
      String expectedResult = """
{
    "age": 21,
    "name": "Gustavo"
}""";

      String result = formatter.format(input, sortAlphabetically: true);

      expect(expectedResult, result);
    });
  });
}
