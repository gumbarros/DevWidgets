import 'package:dev_widgets/src/models/tools/encoders/base64_image_encoder_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/encoders/controllers/base64_image_encoder_controller.dart';
import 'package:get/get.dart';

class Base64ImageEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<Base64ImageEncoderTool>();

    Get.lazyPut<Base64ImageEncoderController>(
        () => Base64ImageEncoderController(tool));
  }
}
