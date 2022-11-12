import 'package:dev_widgets/src/impl/formatters/sql_formatter/formatter/sql_formatter.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_dialect.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sqlDialectProvider =
    StateProvider<SqlDialect>((ref) => SqlDialect.generic);

final inputTextProvider = StateProvider<String>((ref) => "");
final outputTextProvider =
    StateProvider<String>((ref) => formatSql(ref.watch(inputTextProvider)));
