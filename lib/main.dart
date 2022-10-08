import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/widgets/layout/landscape_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
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
        initialBinding: ToolsBinding(),
        locale: Get.deviceLocale,
        getPages: Navigation.pages,
        title: "app_name".tr,
        translations: DevToysTranslations(),
        builder: ((context, child) => YaruTheme(
              child: LandscapeLayout(
                child: child,
                iconBuilder: (context, index, selected) {
                  return Icon(Icons.home);
                },
                titleBuilder: (context, index, selected) {
                  return YaruPageItemTitle.text('YaruBanner');
                },
              ),
            )),
      ),
    );
  }
}
