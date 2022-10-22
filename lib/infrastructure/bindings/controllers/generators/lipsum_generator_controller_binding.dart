import 'package:devtoys/domain/models/tools/generators/lipsum/lipsum_generator_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/generators/controllers/lipsum_generator_controller.dart';
import 'package:get/get.dart';

class LipsumGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    LipsumGeneratorTool tool = getTool<LipsumGeneratorTool>();

    Get.lazyPut<LipsumGeneratorController>(
        () => LipsumGeneratorController(tool));
  }
}
