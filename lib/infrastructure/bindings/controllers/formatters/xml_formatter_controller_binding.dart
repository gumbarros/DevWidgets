import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/formatters/xml_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/formatters/controllers/xml_formatter_controller.dart';
import 'package:get/get.dart';

class XMLFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == XmlFormatterTool)
        as XmlFormatterTool;

    Get.lazyPut<XMLFormatterController>(() => XMLFormatterController(tool));
  }
}
