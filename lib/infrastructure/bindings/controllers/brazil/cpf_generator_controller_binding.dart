import 'package:dev_widgets/domain/models/tools/brazil/cpf_generator_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/brazil/controllers/cpf_generator_controller.dart';
import 'package:get/get.dart';

class CpfGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<CpfTool>();

    Get.lazyPut<CpfGeneratorController>(() => CpfGeneratorController(tool));
  }
}
