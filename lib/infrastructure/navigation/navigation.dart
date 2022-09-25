import 'package:devtoys/infrastructure/bindings/controllers/home_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/json_formatter_controller_binding.dart';
import 'package:devtoys/infrastructure/bindings/controllers/sql_formatter_controller_binding.dart';
import 'package:devtoys/presentation/home/views/home_view.dart';
import 'package:devtoys/presentation/tools/views/json_formatter_view.dart';
import 'package:devtoys/presentation/tools/views/sql_formatter_view.dart';
import 'package:get/get.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.sqlFormatter,
      page: () => const SQLFormatterView(),
      binding: SQLFormatterBinding(),
    ),
    GetPage(
      name: Routes.jsonFormatter,
      page: () => const JSONFormatterView(),
      binding: JSONFormatterBinding(),
    ),
  ];
}
