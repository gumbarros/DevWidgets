import 'package:devtoys/domain/models/tools/generators/lipsum_generator_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/generators/controllers/lipsum_generator_controller.dart';
import 'package:get/get.dart';

class LipsumGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    LipsumGeneratorTool tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == LipsumGeneratorTool)
        as LipsumGeneratorTool;

    Get.lazyPut<LipsumGeneratorController>(
        () => LipsumGeneratorController(tool));
  }
}
