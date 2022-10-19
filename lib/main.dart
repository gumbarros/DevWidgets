import 'package:desktop_window/desktop_window.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/bindings/domains/initial_bindings.dart';
import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/infrastructure/global_settings.dart';
import 'package:devtoys/presentation/layout/linux/linux_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:yaru/yaru.dart';
import 'infrastructure/navigation/navigation.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  if (!kIsWeb) await DesktopWindow.setMinWindowSize(Size(1000, 800));

  final String initialRoute = Routes.getToolRouteByCommandLineArgs(args);
  runApp(Main(initialRoute: initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
                page: () => ResponsiveWrapper.builder(
                      Obx(
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
                      breakpoints: [
                        const ResponsiveBreakpoint.autoScale(360),
                        const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                        const ResponsiveBreakpoint.resize(640,
                            name: 'MOBILE_LARGE'),
                        const ResponsiveBreakpoint.resize(850, name: TABLET),
                        const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
                        const ResponsiveBreakpoint.resize(1440,
                            name: 'DESKTOP_LARGE'),
                        const ResponsiveBreakpoint.resize(2460, name: '4k'),
                      ],
                    ));
          },
        );
      }),
    );
  }
}
