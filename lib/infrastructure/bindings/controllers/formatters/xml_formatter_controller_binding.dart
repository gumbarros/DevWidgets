import 'package:dev_widgets/src/models/tools/formatters/xml_formatter_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/formatters/controllers/xml_formatter_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class XMLFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<XmlFormatterTool>();

    Get.lazyPut<XMLFormatterController>(() => XMLFormatterController(tool));
  }
}
