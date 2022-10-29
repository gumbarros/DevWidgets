import 'package:dev_widgets/src/tools.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:get/get.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<List<Tool>>(() => allTools);
  }
}
