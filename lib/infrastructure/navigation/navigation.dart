import 'package:get/get.dart';
import '../../presentation/home/screens/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Navigation {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}
