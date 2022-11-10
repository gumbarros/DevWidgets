import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/json_to_sql_generator.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

final jsonInputProvider = StateProvider<String>((ref) => "");

final tableNameProvider = StateProvider<String>((ref) => "MyTable");

final valuesProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

final sqlOutputProvider = StateProvider<String>((ref) {
  final tableName = ref.watch(tableNameProvider);
  final fields =
      ref.watch(fieldListProvider).where((element) => element.enabled).toList();
  final values = ref.watch(valuesProvider);

  final generator =
      JsonToSqlGenerator(tableName: tableName, fields: fields, values: values);

  return generator.getCreateTableScript();
});

final isValidJsonProvider = StateProvider<bool>((ref) => false);

final fieldListProvider =
    StateNotifierProvider<JsonToSqlFieldList, List<TableField>>((ref) {
  return JsonToSqlFieldList();
});
