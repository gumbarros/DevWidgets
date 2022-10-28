import 'package:dev_widgets/src/models/tools/tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///TODO REMOVE
final tools = [
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

final toolsProvider = Provider((ref) => tools);
