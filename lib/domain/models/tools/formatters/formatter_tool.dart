import 'package:devtoys/domain/helpers/formatters/formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';

abstract class FormatterTool implements Tool {
  final Formatter formatter;

  FormatterTool(this.formatter);
}
