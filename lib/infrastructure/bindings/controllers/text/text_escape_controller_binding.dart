import 'package:devtoys/domain/models/tools/text/text_escape.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/text/controllers/text_escape_controller.dart';
import 'package:get/get.dart';

class TextEscapeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<TextEscapeTool>();

    Get.lazyPut<TextEscapeController>(() => TextEscapeController(tool));
  }
}
