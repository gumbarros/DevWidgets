import 'package:devtoys/domain/models/categories/category.dart';
import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {

    var categories = Get.find<List<Category>>();

    Get.lazyPut<HomeController>(
      () => HomeController(categories),
    );
  }
}
