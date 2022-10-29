import 'package:dev_widgets/src/generators/lipsum/lipsum_generator_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/generators/controllers/lipsum_generator_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LipsumGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    LipsumGeneratorTool tool = getTool<LipsumGeneratorTool>();

    Get.lazyPut<LipsumGeneratorController>(
        () => LipsumGeneratorController(tool));
  }
}
