import 'package:devtoys/domain/models/tools/text/text_diff_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/text/controllers/text_diff_controller.dart';
import 'package:get/get.dart';

class TextDiffControllerBinding extends Bindings {
  @override
  void dependencies() {
    TextDiffTool tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == TextDiffTool)
        as TextDiffTool;

    Get.lazyPut<TextDiffController>(() => TextDiffController(tool));
  }
}
