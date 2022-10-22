import 'package:devtoys/domain/helpers/formatters/sql_formatter/sql_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SQL Formatter', () {
    test("Format SQL input", () {
      String input = """SELECT * FROM         TABLE""";
      String expectedResult = """SELECT *\nFROM TABLE""";

      var formatter = SqlFormatter();

      String result = formatter.format(input);

      expect(expectedResult, result);
    });
  });
}
