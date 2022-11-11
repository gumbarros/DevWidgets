import 'dart:convert';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/sql_generator.dart'
    as sql_generator;
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_fields_mapper.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_options.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Json to Sql', () {
    const String expectedTable = """CREATE TABLE Product(
	Id INTEGER NOT NULL,
	Name VARCHAR(MAX) NOT NULL,
	Quantity INTEGER NOT NULL,
	Price NUMBER NOT NULL,
	Color VARCHAR(MAX) NULL,
	ManufacturingDate DATETIME NOT NULL
);""";

    const String expectedInsertScript = """
INSERT INTO Product (Id,Name,Quantity,Price,Color,ManufacturingDate) VALUES (1,'My Product',5,100.0,'Red','2012-02-27 13:27:00');
INSERT INTO Product (Id,Name,Quantity,Price,Color,ManufacturingDate) VALUES (2,'My Product 2',2,12.0,NULL,'2012-02-27 13:27:00');
""";

    late List<TableField> fields;
    late List<Map<String, dynamic>> values;

    setUpAll(() {
      values = List<Map<String, dynamic>>.from(jsonDecode(exampleJson));
      fields = getTableFields(values);
    });

    test("Count length of the fields", () {
      expect(fields.length, 6);
    });

    test("Create table script", () {
      final result = sql_generator.getCreateTableScript(
          tableName: "Product", fields: fields, ifNotExists: false);

      expect(result, expectedTable);
    });

    test("Drop table script", () {
      final result =
          sql_generator.getDropTableScript("Product", ifExists: false);

      expect(result, "DROP TABLE Product;");
    });

    test("Insert script", () {
      final result = sql_generator.getInsertScript(
          tableName: "Product", fields: fields, valueList: values);

      expect(result, expectedInsertScript);
    });
  });
}
