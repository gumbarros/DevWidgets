// ignore_for_file: unused_import

import 'package:dev_widgets/src/models/tools/converters/json_yaml_converter_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/converters/controllers/json_yaml_converter_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonYamlConverterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<JsonYamlConverterTool>();

    Get.lazyPut<JsonYamlConverterController>(
        () => JsonYamlConverterController(tool));
  }
}
