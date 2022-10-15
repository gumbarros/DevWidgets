import 'package:devtoys/domain/models/tools/text/text_diff_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/text/controllers/text_diff_controller.dart';
import 'package:get/get.dart';

class TextDiffControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<TextDiffTool>();

    Get.lazyPut<TextDiffController>(() => TextDiffController(tool));
  }
}
