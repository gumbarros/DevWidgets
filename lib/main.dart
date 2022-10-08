import 'package:devtoys/domain/models/tools/tool.dart';

import 'package:devtoys/infrastructure/bindings/domains/initial_binding.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/layout/landscape_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';

void main(List<String> arguments) {
  final String initialRoute = Routes.getToolRouteByCommandLineArgs(arguments);

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetMaterialApp(
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
        locale: Get.deviceLocale,
        defaultTransition: Transition.fade,
        getPages: Navigation.pages,
        title: "DevToys",
        translations: DevToysTranslations(),
        builder: ((context, child) => YaruTheme(
              child: LandscapeLayout(
                child: child,
                tools: Get.find<List<Tool>>(),
              ),
            )),
      ),
    );
  }
}
