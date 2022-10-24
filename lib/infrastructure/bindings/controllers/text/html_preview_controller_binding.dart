import 'package:dev_widgets/domain/models/tools/text/html_preview.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/text/controllers/html_preview_controller.dart';
import 'package:get/get.dart';

class HtmlPreviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<HtmlPreviewTool>();

    Get.lazyPut<HtmlPreviewController>(() => HtmlPreviewController(tool));
  }
}
