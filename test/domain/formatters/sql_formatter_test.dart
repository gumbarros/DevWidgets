import 'package:dev_widgets/domain/helpers/formatters/sql_formatter/sql_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SQL Formatter', () {
    test("Format SQL input", () {
      const String input = """SELECT * FROM         TABLE""";
      const String expectedResult = """SELECT *\nFROM TABLE""";

      final formatter = SqlFormatter();

      final String result = formatter.format(input);

      expect(expectedResult, result);
    });
  });
}
