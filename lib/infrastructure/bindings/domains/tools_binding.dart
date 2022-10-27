import 'package:dev_widgets/src/impl/layout/yaru/providers/tools_provider.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:get/get.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<List<Tool>>(() => tools);
  }
}
