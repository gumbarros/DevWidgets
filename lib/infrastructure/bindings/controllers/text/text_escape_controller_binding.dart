import 'package:dev_widgets/src/models/tools/text/text_escape/text_escape.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/text/controllers/text_escape_controller.dart';
import 'package:get/get.dart';

class TextEscapeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<TextEscapeTool>();

    Get.lazyPut<TextEscapeController>(() => TextEscapeController(tool));
  }
}
