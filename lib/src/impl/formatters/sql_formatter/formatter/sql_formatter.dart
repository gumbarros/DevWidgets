import 'package:dev_widgets/src/impl/formatters/sql_formatter/formatter/generic_sql_formatter.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_dialect.dart';
import 'package:dev_widgets/src/impl/helpers.dart';

abstract class SqlFormatter {
  String format(String sql);
}

String formatSql(String data, {SqlDialect? dialect}) {
  data = applyWebSpaceFix(data);

  var formatter = getFormatter(dialect ?? SqlDialect.generic);

  return formatter.format(data);
}

SqlFormatter getFormatter(SqlDialect language) {
  switch (language) {
    case SqlDialect.generic:
      return GenericSqlFormatter();
  }
}
