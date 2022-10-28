import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:dev_widgets/presentation/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var tools = Get.find<List<Tool>>();

    Get.lazyPut<HomeController>(
      () => HomeController(
          tools.where((tool) => tool.route != Routes.home).toList()),
    );
  }
}
