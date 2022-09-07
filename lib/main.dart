import 'package:devtoys/infrastructure/navigation/bindings/domains/categories.binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'locale/translations.dart';

void main() async {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      initialBinding: CategoriesBinding(),
      locale: Get.deviceLocale,
      getPages: Navigation.pages,
      translations: DevToysTranslations(),
      builder: ((context, child) => YaruTheme(child: child)),
    );
  }
}
