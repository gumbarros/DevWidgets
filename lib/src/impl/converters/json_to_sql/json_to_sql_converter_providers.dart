import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/json_to_sql_generator.dart'
    as sql_generator;
import 'package:dev_widgets/src/impl/converters/json_to_sql/helpers/table_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

final jsonInputProvider = StateProvider<String>((ref) => "");

final tableNameProvider = StateProvider<String>((ref) => "MyTable");

final valuesProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

final enableCreateTableProvider = StateProvider((ref) => true);
final enableCreateTableIfNotExistsProvider = StateProvider((ref) => true);

final enableDropTableProvider = StateProvider((ref) => false);
final enableDropTableIfExistsProvider = StateProvider((ref) => false);

final sqlOutputProvider = StateProvider<String>((ref) {
  final tableName = ref.watch(tableNameProvider);
  final fields =
      ref.watch(fieldListProvider).where((element) => element.enabled).toList();
  // ignore: unused_local_variable
  final values = ref.watch(valuesProvider);

  final enableCreateTable = ref.watch(enableCreateTableProvider);
  final enableCreateTableIfNotExists =
      ref.watch(enableCreateTableIfNotExistsProvider);

  final enableDropTable = ref.watch(enableDropTableProvider);
  final enableDropTableIfExists = ref.watch(enableDropTableIfExistsProvider);

  final output = StringBuffer();

  if (enableDropTable) {
    output.writeln(sql_generator.getDropTableScript(tableName,
        ifExists: enableDropTableIfExists));

    output.writeln();
  }

  if (enableCreateTable) {
    output.writeln(sql_generator.getCreateTableScript(
        tableName: tableName,
        fields: fields,
        ifNotExists: enableCreateTableIfNotExists));

    output.writeln();
  }

  return output.toString();
});

final isValidJsonProvider = StateProvider<bool>((ref) => false);

final fieldListProvider =
    StateNotifierProvider<JsonToSqlFieldList, List<TableField>>((ref) {
  return JsonToSqlFieldList();
});
