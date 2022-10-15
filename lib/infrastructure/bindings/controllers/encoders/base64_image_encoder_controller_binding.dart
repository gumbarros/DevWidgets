import 'package:devtoys/domain/models/tools/encoders/base64_image_encoder_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/encoders/controllers/base64_image_encoder_controller.dart';
import 'package:get/get.dart';

class Base64ImageEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<Base64ImageEncoderTool>();

    Get.lazyPut<Base64ImageEncoderController>(
        () => Base64ImageEncoderController(tool));
  }
}
