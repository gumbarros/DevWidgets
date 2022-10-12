import 'package:devtoys/domain/models/tools/generators/uuid_generator_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/generators/controllers/uuid_generator_controller.dart';
import 'package:get/get.dart';

class UuidGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    UuidGeneratorTool tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == UuidGeneratorTool)
        as UuidGeneratorTool;

    Get.lazyPut<UuidGeneratorController>(() => UuidGeneratorController(tool));
  }
}
