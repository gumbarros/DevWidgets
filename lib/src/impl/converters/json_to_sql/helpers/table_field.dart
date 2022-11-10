import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/data_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Represents a SQL table field.
@immutable
class TableField {
  ///Unique identifier for this field.
  final String fieldId;
  final String fieldName;
  final DataType dataType;
  final int? length;
  final bool primaryKey;
  final bool enabled;
  final bool required;

  const TableField(
      {required this.fieldId,
      required this.fieldName,
      required this.dataType,
      required this.length,
      required this.primaryKey,
      required this.enabled,
      required this.required});

  TableField copyWith(
      {String? fieldName,
      DataType? dataType,
      int? length,
      bool? primaryKey,
      bool? enabled,
      bool? required}) {
    return TableField(
        fieldId: fieldId,
        fieldName: fieldName ?? this.fieldName,
        dataType: dataType ?? this.dataType,
        length: length ?? this.length,
        primaryKey: primaryKey ?? this.primaryKey,
        enabled: enabled ?? this.enabled,
        required: required ?? this.required);
  }
}

/// An object that controls a list of [TableField].
class JsonToSqlFieldList extends StateNotifier<List<TableField>> {
  JsonToSqlFieldList() : super([]);

  void setState(List<TableField> fields) => state = fields;

  void setFieldName({required String fieldId, required String name}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId)
          field.copyWith(fieldName: name)
        else
          field,
    ];
  }

  void setFieldLength({required String fieldId, required int? length}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId) field.copyWith(length: length) else field,
    ];
  }

  void setDataType({required String fieldId, required DataType dataType}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId)
          field.copyWith(dataType: dataType)
        else
          field,
    ];
  }

  void setFieldEnabled({required String fieldId, bool? enabled}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId)
          field.copyWith(enabled: enabled)
        else
          field,
    ];
  }

  void setFieldRequired({required String fieldId, bool? required}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId)
          field.copyWith(required: required)
        else
          field,
    ];
  }

  void setFieldPrimaryKey({required String fieldId, bool? primaryKey}) {
    state = [
      for (final field in state)
        if (field.fieldId == fieldId)
          field.copyWith(primaryKey: primaryKey)
        else
          field,
    ];
  }
}
