import 'package:devtoys/domain/factory/tools_factory.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:get/get.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<List<Tool>>(
      ToolsFactory.getAllTools()
    );
  }
}