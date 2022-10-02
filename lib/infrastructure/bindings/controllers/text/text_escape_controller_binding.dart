import 'package:devtoys/domain/models/tools/text/text_escape.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/text/controllers/text_escape_controller.dart';
import 'package:get/get.dart';

class TextEscapeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == TextEscapeTool)
        as TextEscapeTool;

    Get.lazyPut<TextEscapeController>(() => TextEscapeController(tool));
  }
}
