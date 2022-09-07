import 'package:devtoys/domain/categories/category.dart';
import 'package:devtoys/domain/categories/converters_category.dart';
import 'package:devtoys/domain/categories/encoders_category.dart';
import 'package:get/get.dart';


class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<List<Category>>(
      <Category>[ConvertersCategory(), EncodersCategory()]
    );
  }
}