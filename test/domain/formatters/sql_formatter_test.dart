import 'package:dev_widgets/src/impl/formatters/sql_formatter/formatter/sql_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SQL Formatter', () {
    test("Format SQL input", () {
      const String input = """SELECT * FROM         TABLE""";
      const String expectedResult = """SELECT *\nFROM TABLE""";

      final String result = formatSql(input);

      expect(expectedResult, result);
    });
  });
}
