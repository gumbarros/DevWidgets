import 'package:devtoys/domain/helpers/formatters/formatter.dart';
import 'package:devtoys/domain/helpers/formatters/sql_formatter/generic_sql_formatter_provider.dart';
import 'package:devtoys/domain/helpers/formatters/sql_formatter/sql_formatter_provider.dart';
import 'package:devtoys/domain/helpers/utils.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter/sql_dialect.dart';

class SqlFormatter implements Formatter {
  @override
  String format(String data, {SqlDialect? dialect}) {
    data = applyWebSpaceFix(data);

    var provider = getProvider(dialect ?? SqlDialect.generic);

    return provider.format(data);
  }

  SqlFormatterProvider getProvider(SqlDialect language) {
    switch (language) {
      case SqlDialect.generic:
        return GenericSqlFormatterProvider();
    }
  }
}
