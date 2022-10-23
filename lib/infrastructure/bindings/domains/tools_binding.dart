import 'package:dev_widgets/domain/models/tools/brazil/cpf_generator_tool.dart';
import 'package:dev_widgets/domain/models/tools/converters/json_to_class_converter_tool.dart';
import 'package:dev_widgets/domain/models/tools/converters/json_yaml_converter_tool.dart';
import 'package:dev_widgets/domain/models/tools/encoders/base64_image_encoder_tool.dart';
import 'package:dev_widgets/domain/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:dev_widgets/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:dev_widgets/domain/models/tools/encoders/url_encoder_tool.dart';
import 'package:dev_widgets/domain/models/tools/formatters/json_formatter_tool.dart';
import 'package:dev_widgets/domain/models/tools/formatters/sql_formatter/sql_formatter_tool.dart';
import 'package:dev_widgets/domain/models/tools/formatters/xml_formatter_tool.dart';
import 'package:dev_widgets/domain/models/tools/generators/lipsum/lipsum_generator_tool.dart';
import 'package:dev_widgets/domain/models/tools/generators/uuid/uuid_generator_tool.dart';
import 'package:dev_widgets/domain/models/tools/home_tool.dart';
import 'package:dev_widgets/domain/models/tools/text/markdown_preview.dart';
import 'package:dev_widgets/domain/models/tools/text/text_diff_tool.dart';
import 'package:dev_widgets/domain/models/tools/text/text_escape/text_escape.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:get/get.dart';

class ToolsBinding extends Bindings {
  static List<Tool> getAllTools() {
    var tools = [
      HtmlEncoderTool(),
      JsonFormatterTool(),
      SqlFormatterTool(),
      TextEscapeTool(),
      XmlFormatterTool(),
      MarkdownPreviewTool(),
      TextDiffTool(),
      UrlEncoderTool(),
      CpfTool(),
      LipsumGeneratorTool(),
      UuidGeneratorTool(),
      Base64TextEncoderTool(),
      Base64ImageEncoderTool(),
      JsonToClassConverterTool(),
      JsonYamlConverterTool()
    ];

    tools.sort((a, b) => a.group.name.compareTo(b.group.name));
    tools.insert(0, HomeTool());
    return tools;
  }

  static Tool getToolByName(String name) {
    final tools = Get.find<List<Tool>>();
    return tools.firstWhere((t) => t.name == name);
  }

  @override
  void dependencies() {
    Get.lazyPut<List<Tool>>(() => getAllTools());
  }
}
