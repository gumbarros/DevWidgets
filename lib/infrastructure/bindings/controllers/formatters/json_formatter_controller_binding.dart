import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/formatters/controllers/json_formatter_controller.dart';
import 'package:get/get.dart';

class JsonFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<JsonFormatterTool>();

    Get.lazyPut<JsonFormatterController>(() => JsonFormatterController(tool));
  }
}
