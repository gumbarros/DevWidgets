import 'package:dev_widgets/src/models/tools/text/text_diff_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/text/controllers/text_diff_controller.dart';
import 'package:get/get.dart';

class TextDiffControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<TextDiffTool>();

    Get.lazyPut<TextDiffController>(() => TextDiffController(tool));
  }
}
