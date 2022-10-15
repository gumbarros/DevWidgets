import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/bindings/domains/initial_bindings.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:devtoys/presentation/layout/linux/linux_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';

main(List<String> arguments) async {
  await GetStorage.init();
  GoogleFonts.config.allowRuntimeFetching = true;
  final String initialRoute = Routes.getToolRouteByCommandLineArgs(arguments);
  runApp(Main(initialRoute: initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetMaterialApp(
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
        locale: GlobalSettings.getLocale(),
        fallbackLocale: Locale("en", "US"),
        defaultTransition: Transition.fade,
        getPages: Navigation.pages,
        title: "DevToys",
        translations: DevToysTranslations(),
        builder: ((context, child) {
          return Navigator(
            onGenerateRoute: (_) {
              return GetPageRoute(
                page: () => Obx(
                  () => YaruTheme(
                    data: YaruThemeData(
                        highContrast: GlobalSettings.getHighContrast(),
                        variant: GlobalSettings.getYaruVariant(),
                        themeMode: GlobalSettings.getThemeMode()),
                    child: LinuxLayout(
                      child: child,
                      tools: Get.find<List<Tool>>(),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
