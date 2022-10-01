import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/home/controllers/home_controller.dart';
import 'package:get/get.dart';

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
