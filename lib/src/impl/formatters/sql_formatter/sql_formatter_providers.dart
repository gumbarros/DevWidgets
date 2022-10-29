import 'package:code_text_field/code_text_field.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/formatter/sql_formatter.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_dialect.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/sql.dart';

final sqlDialectProvider =
    StateProvider<SqlDialect>((ref) => SqlDialect.generic);

final outputTextProvider = StateProvider<String>((ref) => "");

final inputControllerProvider = StateProvider<CodeController>((ref) {
  final inputController = CodeController(language: sql);

  inputController.addListener(() {
    try {
      ref.read(outputTextProvider.notifier).state =
          formatSql(inputController.text);
    } catch (_) {
      //Bug on code_text_field package.
    }
  });

  return inputController;
});
