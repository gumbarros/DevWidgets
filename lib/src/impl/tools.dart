import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cnpj_generator_tool.dart';
import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_generator_tool.dart';
import 'package:dev_widgets/src/impl/converters/json_to_class/json_to_class_converter_tool.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/json_to_sql_converter_tool.dart';
import 'package:dev_widgets/src/impl/converters/json_yaml/json_yaml_converter_tool.dart';
import 'package:dev_widgets/src/impl/encoders/base64_image/base64_image_encoder_tool.dart';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_text_encoder_tool.dart';
import 'package:dev_widgets/src/impl/encoders/html/html_encoder_tool.dart';
import 'package:dev_widgets/src/impl/encoders/url/url_encoder_tool.dart';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter_tool.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:dev_widgets/src/impl/formatters/xml_formatter/xml_formatter_tool.dart';
import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_generator_tool.dart';
import 'package:dev_widgets/src/impl/generators/uuid/uuid_generator_tool.dart';
import 'package:dev_widgets/src/impl/home/home_tool.dart';
import 'package:dev_widgets/src/impl/settings/settings_tool.dart';
import 'package:dev_widgets/src/impl/text/html_preview/html_preview_tool.dart';
import 'package:dev_widgets/src/impl/text/markdown_preview/markdown_preview_tool.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_tool.dart';
import 'package:dev_widgets/src/impl/text/text_escape/text_escape_tool.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_tool.dart';
import 'package:dev_widgets/src/tool.dart';

const allTools = [
  HomeTool(),
  HtmlEncoderTool(),
  SettingsTool(),
  JsonFormatterTool(),
  SqlFormatterTool(),
  TextEscapeTool(),
  XmlFormatterTool(),
  MarkdownPreviewTool(),
  TextDiffTool(),
  UrlEncoderTool(),
  CpfGeneratorTool(),
  LipsumGeneratorTool(),
  UuidGeneratorTool(),
  Base64TextEncoderTool(),
  Base64ImageEncoderTool(),
  JsonToClassConverterTool(),
  JsonYamlConverterTool(),
  CnpjGeneratorTool(),
  HtmlPreviewTool(),
  TextInspectorTool(),
  JsonToSqlConverterTool()
];

Tool getToolByName(String name) => allTools.firstWhere((t) => t.name == name);
