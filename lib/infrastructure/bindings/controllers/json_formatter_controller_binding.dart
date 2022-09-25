import 'package:devtoys/domain/models/tools/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/tools/controllers/json_formatter_controller.dart';
import 'package:get/get.dart';

class JSONFormatterBinding extends Bindings {
  @override
  void dependencies() {
    var tool = Get.find<List<Tool>>()
            .firstWhere((element) => element.runtimeType == JSONFormatterTool)
        as JSONFormatterTool;

    Get.lazyPut<JSONFormatterController>(() => JSONFormatterController(tool));
  }
}
