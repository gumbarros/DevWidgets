import 'package:dev_widgets/src/tools_provider.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<List<Tool>>(() => tools);
  }
}
