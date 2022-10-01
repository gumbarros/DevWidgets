import 'package:devtoys/domain/helpers/encoders/html_encoder.dart';
import 'package:devtoys/domain/helpers/formatters/json_formatter.dart';
import 'package:devtoys/domain/helpers/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';

class ToolsFactory {
  static List<Tool> getAllTools() {
    return [
      HtmlEncoderTool(HTMLEncoder()),
      JSONFormatterTool(JSONFormatter()),
      SQLFormatterTool(SQLFormatter()),
    ];
  }
}
