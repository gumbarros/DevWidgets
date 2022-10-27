import 'package:dev_widgets/src/models/tools/encoders/html_encoder_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/encoders/controllers/html_encoder_controller.dart';
import 'package:get/get.dart';

class HTMLEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<HtmlEncoderTool>();

    Get.lazyPut<HTMLEncoderController>(() => HTMLEncoderController(tool));
  }
}
