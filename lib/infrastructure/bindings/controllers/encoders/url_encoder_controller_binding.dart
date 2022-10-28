import 'package:dev_widgets/src/models/tools/encoders/url_encoder_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/encoders/controllers/url_encoder_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class UrlEncoderControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<UrlEncoderTool>();

    Get.lazyPut<UrlEncoderController>(() => UrlEncoderController(tool));
  }
}
