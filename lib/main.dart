import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'locale/translations.dart';

void main(){
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetMaterialApp(
        initialRoute: Routes.home,
        debugShowCheckedModeBanner: false,
        title: "app_name".tr,
        initialBinding: ToolsBinding(),
        locale: Get.deviceLocale,
        getPages: Navigation.pages,
        translations: DevToysTranslations(),
        builder: ((context, child) => YaruTheme(child: child)),
      ),
    );
  }
}
