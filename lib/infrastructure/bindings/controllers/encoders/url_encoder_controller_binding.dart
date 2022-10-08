import 'package:devtoys/domain/models/tools/encoders/html_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/encoders/url_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/encoders/controllers/url_encoder_controller.dart';
import 'package:get/get.dart';

class URLEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == URLEncoderTool)
        as URLEncoderTool;

    Get.lazyPut<URLEncoderController>(() => URLEncoderController(tool));
  }
}
