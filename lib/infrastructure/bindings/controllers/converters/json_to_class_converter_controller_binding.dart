import 'package:dev_widgets/src/models/tools/converters/json_to_class_converter_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/converters/controllers/json_to_class_converter_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToClassConverterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<JsonToClassConverterTool>();

    Get.lazyPut<JsonToClassConverterController>(
        () => JsonToClassConverterController(tool));
  }
}
