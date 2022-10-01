import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/formatters/controllers/json_formatter_controller.dart';
import 'package:get/get.dart';

class HTMLEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == HtmlEncoderTool)
        as JSONFormatterTool;

    Get.lazyPut<JSONFormatterController>(() => JSONFormatterController(tool));
  }
}
