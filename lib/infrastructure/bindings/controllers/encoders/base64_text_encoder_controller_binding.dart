import 'package:dev_widgets/src/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/encoders/controllers/base64_text_encoder_controller.dart';
import 'package:get/get.dart';

class Base64TextEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<Base64TextEncoderTool>();

    Get.lazyPut<Base64TextEncoderController>(
        () => Base64TextEncoderController(tool));
  }
}
