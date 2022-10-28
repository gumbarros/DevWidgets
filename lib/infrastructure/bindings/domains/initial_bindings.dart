import 'package:dev_widgets/infrastructure/bindings/domains/groups_binding.dart';
import 'package:dev_widgets/infrastructure/bindings/domains/tools_binding.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    GroupsBinding().dependencies();
    ToolsBinding().dependencies();
  }
}
