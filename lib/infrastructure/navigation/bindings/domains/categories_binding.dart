import 'package:devtoys/domain/models/categories/categories_factory.dart';
import 'package:devtoys/domain/models/categories/category.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<List<Category>>(
      CategoriesFactory.getCategories()
    );
  }
}