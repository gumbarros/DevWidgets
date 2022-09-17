import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/presentation/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {

    var tools = Get.find<List<Tool>>();

    Get.lazyPut<HomeController>(
      () => HomeController(tools),
    );
  }
}
