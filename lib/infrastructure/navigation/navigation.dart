import 'package:devtoys/presentation/home/screens/home_screen.dart';
import 'package:get/get.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    )
  ];
}
