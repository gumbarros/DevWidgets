import 'package:dev_widgets/src/models/tools/tools.dart';

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
