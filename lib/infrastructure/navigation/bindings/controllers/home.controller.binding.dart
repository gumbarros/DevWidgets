import 'package:devtoys/domain/categories/category.dart';
import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {

    var categories = Get.find<List<Category>>();

    Get.lazyPut<HomeController>(
      () => HomeController(categories),
    );
  }
}
