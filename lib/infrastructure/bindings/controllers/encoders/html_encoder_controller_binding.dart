import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/encoders/controllers/html_encoder_controller.dart';
import 'package:get/get.dart';

class HTMLEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == HtmlEncoderTool)
        as HtmlEncoderTool;

    Get.lazyPut<HTMLEncoderController>(() => HTMLEncoderController(tool));
  }
}
