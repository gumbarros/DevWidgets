import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';

List<TableField> getTableFields(List<Map<String, dynamic>> values) {
  final fields = <TableField>[];

  for (Map map in values) {
    map.removeWhere((key, value) =>
        (value.runtimeType == List<dynamic>) || (_isMap(value)));

    for (final entry in map.entries) {
      if (!fields.map((f) => f.fieldId).contains(entry.key)) {
        final dataType = _getFieldType(entry.value);

        fields.add(TableField(
            fieldId: entry.key,
            fieldName: entry.key,
            dataType: dataType,
            length: null,
            primaryKey: fields.isEmpty && dataType == DataType.integer,
            enabled: true,
            required: values.every((element) => element[entry.key] != null)));
      }
    }
  }

  return fields;
}

bool _isMap(value) {
  try {
    value.keys;
    return true;
  } on NoSuchMethodError {
    return false;
  }
}

DataType _getFieldType(dynamic value) {
  switch (value.runtimeType) {
    case const (int):
      return DataType.integer;
    case const (bool):
      return DataType.bit;
    case const (num):
    case const (double):
      return DataType.number;
    default:
      if (DateTime.tryParse(value.toString()) != null) {
        return DataType.dateTime;
      }
      return DataType.varChar;
  }
}
