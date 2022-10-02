import 'package:devtoys/domain/models/tools/text/markdown_preview.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/text/controllers/markdown_preview_controller.dart';
import 'package:get/get.dart';

class MarkdownPreviewControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == MarkdownPreviewTool)
        as MarkdownPreviewTool;

    Get.lazyPut<MarkdownPreviewController>(
        () => MarkdownPreviewController(tool));
  }
}
