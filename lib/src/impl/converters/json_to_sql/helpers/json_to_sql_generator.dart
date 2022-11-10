import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';

class JsonToSqlGenerator {
  final String tableName;
  final List<TableField> fields;
  final List<Map<String, dynamic>> values;

  JsonToSqlGenerator(
      {required this.tableName, required this.fields, required this.values});

  ///
/*(CREATE TABLE mytable(
   Id                INTEGER  NOT NULL PRIMARY KEY 
  ,Name              VARCHAR(12) NOT NULL
  ,Quantity          INTEGER  NOT NULL
  ,Price             INTEGER  NOT NULL
  ,Color             VARCHAR(4) NOT NULL
  ,ManufacturingDate VARCHAR(19) NOT NULL
);
*/
  String getCreateTableScript() {
    final buffer = StringBuffer();

    buffer.writeln("CREATE TABLE $tableName(");

    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];

      buffer.write("\t${field.fieldName} ${field.dataType}");

      if (field.dataType == DataType.varChar) {
        buffer.write("(${field.length ?? "MAX"})");
      }

      buffer.write(field.required ? " NOT NULL" : " NULL");

      if (field.primaryKey) {
        buffer.write("PRIMARY KEY");
      }

      buffer.writeln(i != fields.length - 1 ? "," : "");
    }

    buffer.write(");");

    return buffer.toString();
  }
}
