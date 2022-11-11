import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';

String getCreateTableScript(
    {required String tableName,
    required List<TableField> fields,
    required bool ifNotExists}) {
  final script = StringBuffer();

  script.write("CREATE TABLE");

  if (ifNotExists) {
    script.write(" IF NOT EXISTS");
  }

  script.writeln(" $tableName(");

  final primaryKeys =
      fields.where((f) => f.primaryKey).map((k) => k.fieldName).toList();
  final isSinglePrimaryKey = primaryKeys.length == 1;

  for (var i = 0; i < fields.length; i++) {
    final field = fields[i];

    script.write("\t${field.fieldName} ${field.dataType}");

    if (field.dataType == DataType.varChar) {
      script.write("(${field.length ?? "MAX"})");
    }

    script.write(field.required && !field.primaryKey ? " NOT NULL" : " NULL");

    if (field.primaryKey && isSinglePrimaryKey) {
      script.write(" PRIMARY KEY");
    }

    script.writeln(i != fields.length - 1
        ? ","
        : primaryKeys.length > 1
            ? ","
            : "");
  }

  if (primaryKeys.length > 1) {
    script.write(" CONSTRAINT PK_$tableName PRIMARY KEY (");

    for (var i = 0; i < primaryKeys.length; i++) {
      script.write(primaryKeys[i]);
      script.write(i != primaryKeys.length - 1 ? "," : "");
    }
    script.writeln(")");
  }

  script.write(");");

  return script.toString();
}

String getDropTableScript(String tableName, {required bool ifExists}) {
  final script = StringBuffer();

  script.write("DROP TABLE");

  if (ifExists) {
    script.write(" IF EXISTS");
  }

  script.write(" $tableName;");

  return script.toString();
}

String _getInsertFields(List<TableField> fields) {
  final buffer = StringBuffer();

  buffer.write("(");

  for (var i = 0; i < fields.length; i++) {
    buffer.write(fields[i].fieldName);
    buffer.write(i != fields.length - 1 ? "," : "");
  }

  buffer.write(")");

  return buffer.toString();
}

String _getInsertValues(Map<String, dynamic> valueList) {
  final buffer = StringBuffer();

  buffer.write("(");

  for (var i = 0; i < valueList.entries.length; i++) {
    final value = valueList.entries.elementAt(i).value;

    if (value is String || value is DateTime) {
      buffer.write("'$value'");
    } else {
      buffer.write(value ?? "NULL");
    }
    buffer.write(i != valueList.length - 1 ? "," : "");
  }

  buffer.write(")");

  return buffer.toString();
}

String getInsertScript(
    {required String tableName,
    required List<TableField> fields,
    required List<Map<String, dynamic>> valueList}) {
  final script = StringBuffer();

  final insertFields = _getInsertFields(fields);

  for (var map in valueList) {
    final values = _getInsertValues(map);
    script.writeln("INSERT INTO $tableName $insertFields VALUES $values;");
  }

  return script.toString();
}
