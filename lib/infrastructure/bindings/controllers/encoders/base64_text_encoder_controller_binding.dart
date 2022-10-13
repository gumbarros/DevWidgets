import 'package:devtoys/domain/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/encoders/controllers/base64_text_encoder_controller.dart';
import 'package:get/get.dart';

class Base64TextEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>().firstWhere(
            (element) => element.runtimeType == Base64TextEncoderTool)
        as Base64TextEncoderTool;

    Get.lazyPut<Base64TextEncoderController>(
        () => Base64TextEncoderController(tool));
  }
}
