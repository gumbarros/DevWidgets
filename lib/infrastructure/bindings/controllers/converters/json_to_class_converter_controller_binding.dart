import 'package:devtoys/domain/models/tools/converters/json_to_class_converter_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/converters/controllers/json_to_class_converter_controller.dart';
import 'package:get/get.dart';

class JsonToClassConverterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<JsonToClassConverterTool>();

    Get.lazyPut<JsonToClassConverterController>(
        () => JsonToClassConverterController(tool));
  }
}
