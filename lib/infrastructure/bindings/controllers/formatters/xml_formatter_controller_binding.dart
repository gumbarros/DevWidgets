import 'package:devtoys/domain/models/tools/formatters/xml_formatter_tool.dart';
import 'package:devtoys/infrastructure/bindings/controllers/get_tool.dart';
import 'package:devtoys/presentation/formatters/controllers/xml_formatter_controller.dart';
import 'package:get/get.dart';

class XMLFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<XmlFormatterTool>();

    Get.lazyPut<XMLFormatterController>(() => XMLFormatterController(tool));
  }
}
