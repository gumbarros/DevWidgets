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

    script.write("    ${field.fieldName} ${field.dataType}");

    if (field.dataType == DataType.varChar) {
      script.write("(${field.length ?? "MAX"})");
    }

    script.write(field.required || field.primaryKey ? " NOT NULL" : " NULL");

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

String _getValue(dynamic value) {
  if (value is String || value is DateTime) {
    return "'$value'";
  } else {
    return value?.toString() ?? "NULL";
  }
}

String _getInsertValues(Map<String, dynamic> values) {
  final buffer = StringBuffer();

  buffer.write("(");

  for (var i = 0; i < values.entries.length; i++) {
    final value = values.entries.elementAt(i).value;

    buffer.write(_getValue(value));
    buffer.write(i != values.length - 1 ? "," : "");
  }

  buffer.write(")");

  return buffer.toString();
}

String getInsertScript(
    {required String tableName,
    required List<TableField> fields,
    required List<Map<String, dynamic>> values}) {
  final script = StringBuffer();

  final insertFields = _getInsertFields(fields);

  for (var map in values) {
    final insertValues = _getInsertValues(map);
    script
        .writeln("INSERT INTO $tableName $insertFields VALUES $insertValues;");
  }

  return script.toString();
}

String _getUpdateValues(List<TableField> fields, Map<String, dynamic> map) {
  final buffer = StringBuffer();

  final nonPrimaryKeyFields =
      fields.where((f) => !f.primaryKey).map((f) => f.fieldName).toList();

  final nonPrimaryKeyValues =
      map.entries.where((entry) => nonPrimaryKeyFields.contains(entry.key));

  for (var i = 0; i < nonPrimaryKeyValues.length; i++) {
    final field = nonPrimaryKeyFields[i];

    final value = nonPrimaryKeyValues.elementAt(i).value;

    buffer.write("$field = ${_getValue(value)}");

    buffer.write(i != nonPrimaryKeyValues.length - 1 ? "," : "");
  }

  return buffer.toString();
}

String _getWhere(List<TableField> fields, Map<String, dynamic> map) {
  final buffer = StringBuffer();

  final primaryKeyFields =
      fields.where((f) => f.primaryKey).map((f) => f.fieldName).toList();

  final primaryKeyValues =
      map.entries.where((entry) => primaryKeyFields.contains(entry.key));

  for (var i = 0; i < primaryKeyValues.length; i++) {
    final field = primaryKeyFields[i];

    final value = primaryKeyValues.elementAt(i).value;
    buffer.write("$field = ${_getValue(value)}");

    buffer.write(i != primaryKeyValues.length - 1 ? "," : "");
  }

  return buffer.toString();
}

String getUpdateScript(
    {required String tableName,
    required List<TableField> fields,
    required List<Map<String, dynamic>> values}) {
  final script = StringBuffer();

  for (var map in values) {
    final updateValues = _getUpdateValues(fields, map);
    final where = _getWhere(fields, map);
    script.writeln("UPDATE $tableName SET $updateValues WHERE $where;");
  }

  return script.toString();
}

String getDeleteScript(
    {required String tableName,
    required List<TableField> fields,
    required List<Map<String, dynamic>> values}) {
  final script = StringBuffer();

  for (var map in values) {
    final where = _getWhere(fields, map);
    script.writeln("DELETE FROM $tableName WHERE $where;");
  }

  return script.toString();
}
