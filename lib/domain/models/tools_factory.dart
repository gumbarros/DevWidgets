import 'package:devtoys/domain/helpers/encoders/html_encoder.dart';
import 'package:devtoys/domain/helpers/formatters/json_formatter.dart';
import 'package:devtoys/domain/helpers/formatters/sql_formatter.dart';
import 'package:devtoys/domain/helpers/text/text_escaper.dart';
import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/domain/models/tools/text/text_escape.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';

class ToolsFactory {
  static List<Tool> getAllTools() {
    return [
      HtmlEncoderTool(HTMLEncoder()),
      JSONFormatterTool(JSONFormatter()),
      SQLFormatterTool(SQLFormatter()),
      TextEscapeTool(TextEscaper()),
      HomeTool()
    ];
  }

  static String getToolRouteByCommandLineArgs(List<String> args) {
    if (args.isNotEmpty) {
      var tools = getAllTools();
      return tools
          .firstWhere((tool) => tool.commandLineArgName == args.first,
              orElse: () => HomeTool())
          .route;
    }
    return Routes.home;
  }
}
