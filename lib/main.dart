import 'package:devtoys/domain/models/tools_factory.dart';
import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main(List<String> arguments) {
  final String initialRoute = arguments.isNotEmpty
      ? ToolsFactory.getToolRouteByCommandLineArg(arguments.first)
      : Routes.home;

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        initialBinding: ToolsBinding(),
        locale: Get.deviceLocale,
        getPages: Navigation.pages,
        title: "app_name".tr,
        translations: DevToysTranslations(),
        builder: ((context, child) => YaruTheme(child: child)),
      ),
    );
  }
}
