import 'package:devtoys/domain/models/tools/text/markdown_preview.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/text/controllers/markdown_preview_controller.dart';
import 'package:get/get.dart';

class MarkdownPreviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<MarkdownPreviewTool>();

    Get.lazyPut<MarkdownPreviewController>(
        () => MarkdownPreviewController(tool));
  }
}
