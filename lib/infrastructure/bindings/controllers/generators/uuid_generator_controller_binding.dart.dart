import 'package:dev_widgets/src/models/tools/generators/uuid/uuid_generator_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/generators/controllers/uuid_generator_controller.dart';
import 'package:get/get.dart';

class UuidGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    UuidGeneratorTool tool = getTool<UuidGeneratorTool>();

    Get.lazyPut<UuidGeneratorController>(() => UuidGeneratorController(tool));
  }
}
