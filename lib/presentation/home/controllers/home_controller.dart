import 'package:devtoys/domain/models/categories/category.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Category> categories;

  HomeController(this.categories);

  List<Tool> getAllTools(){
    var tools = <Tool>[];

    for (var category in categories) {
      for (var tool in category.tools) {
        tools.add(tool);
      }
    }

    return tools;
  }
}
