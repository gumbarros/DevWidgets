import 'package:dev_widgets/src/brazil/cpf_cnpj/cnpj_generator_tool.dart';
import 'package:dev_widgets/src/brazil/cpf_cnpj/cpf_generator_tool.dart';
import 'package:dev_widgets/src/converters/json_class/json_to_class_converter_tool.dart';
import 'package:dev_widgets/src/converters/json_yaml/json_yaml_converter_tool.dart';
import 'package:dev_widgets/src/encoders/base64_image/base64_image_encoder_tool.dart';
import 'package:dev_widgets/src/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:dev_widgets/src/models/tools/encoders/html_encoder_tool.dart';
import 'package:dev_widgets/src/models/tools/encoders/url_encoder_tool.dart';
import 'package:dev_widgets/src/formatters/json_formatter/json_formatter_tool.dart';
import 'package:dev_widgets/src/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:dev_widgets/src/formatters/xml_formatter/xml_formatter_tool.dart';
import 'package:dev_widgets/src/generators/lipsum/lipsum_generator_tool.dart';
import 'package:dev_widgets/src/generators/uuid/uuid_generator_tool.dart';
import 'package:dev_widgets/src/home/home_tool.dart';
import 'package:dev_widgets/src/text/html_preview/html_preview_tool.dart';
import 'package:dev_widgets/src/text/markdown_preview/markdown_preview_tool.dart';
import 'package:dev_widgets/src/text/text_diff/text_diff_tool.dart';
import 'package:dev_widgets/src/text/text_escape/text_escape_tool.dart';
import 'package:dev_widgets/src/models/tool.dart';

const allTools = [
  HomeTool(),
  HtmlEncoderTool(),
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
  HtmlPreviewTool()
];

Tool getToolByName(String name) => allTools.firstWhere((t) => t.name == name);
