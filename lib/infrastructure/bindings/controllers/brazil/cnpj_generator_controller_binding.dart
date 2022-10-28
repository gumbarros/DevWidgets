import 'package:dev_widgets/src/models/tools/brazil/cnpj_generator_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/brazil/controllers/cnpj_generator_controller.dart';
import 'package:get/get.dart';

class CnpjGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<CnpjGeneratorTool>();

    Get.lazyPut<CnpjGeneratorController>(() => CnpjGeneratorController(tool));
  }
}
