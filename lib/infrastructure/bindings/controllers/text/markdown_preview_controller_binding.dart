import 'package:dev_widgets/domain/models/tools/text/markdown_preview.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/text/controllers/markdown_preview_controller.dart';
import 'package:get/get.dart';

class MarkdownPreviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<MarkdownPreviewTool>();

    Get.lazyPut<MarkdownPreviewController>(
        () => MarkdownPreviewController(tool));
  }
}
