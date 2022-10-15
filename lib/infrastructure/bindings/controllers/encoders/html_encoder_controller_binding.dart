import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/encoders/controllers/html_encoder_controller.dart';
import 'package:get/get.dart';

class HTMLEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<HTMLEncoderTool>();

    Get.lazyPut<HTMLEncoderController>(() => HTMLEncoderController(tool));
  }
}
