import 'package:devtoys/infrastructure/bindings/domains/groups_binding.dart';
import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    GroupsBinding().dependencies();
    ToolsBinding().dependencies();
  }
}
