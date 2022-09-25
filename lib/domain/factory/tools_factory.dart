import 'package:devtoys/domain/formatters/json_formatter.dart';
import 'package:devtoys/domain/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/converters/cron_parser_tool.dart';
import 'package:devtoys/domain/models/tools/converters/json_yaml_converter_tool.dart';
import 'package:devtoys/domain/models/tools/converters/number_base_converter_tool.dart';
import 'package:devtoys/domain/models/tools/converters/timestamp_converter_tool.dart';
import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/xml_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';

class ToolsFactory {
  static List<Tool> getAllTools() {
    return [
      CronParserTool(),
      JsonYamlConverterTool(),
      NumberBaseConverterTool(),
      TimestampConverterTool(),
      HtmlEncoderTool(),
      JSONFormatterTool(JSONFormatter()),
      SQLFormatterTool(SQLFormatter()),
      XmlFormatterTool()
    ];
  }
}
