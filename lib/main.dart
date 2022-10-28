import 'package:dev_widgets/src/impl/layout/yaru/ui/yaru_layout.dart';
import 'package:dev_widgets/src/impl/settings/settings_provider.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/bindings/domains/initial_bindings.dart';
import 'package:dev_widgets/src/supported_locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'infrastructure/navigation/navigation.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await EasyLocalization.ensureInitialized();

  final String initialRoute = Routes.getToolRouteByCommandLineArgs(args);
  runApp(EasyLocalization(
      path: 'assets/translations',
      assetLoader: YamlAssetLoader(),
      fallbackLocale: const Locale("en", "US"),
      supportedLocales: supportedLocales.map((l) => l.locale).toList(),
      child: Main(initialRoute: initialRoute)));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) => GetMaterialApp(
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: ref.watch(settingsProvider).locale,
          initialBinding: InitialBindings(),
          getPages: Navigation.pages,
          defaultTransition: Transition.fade,
          title: "DevWidgets",
          builder: ((context, child) {
            return Navigator(
              onGenerateRoute: (_) {
                return GetPageRoute(
                    page: () => ResponsiveWrapper.builder(
                          YaruLayout(
                            tools: Get.find<List<Tool>>(),
                            child: child,
                          ),
                          breakpoints: [
                            const ResponsiveBreakpoint.autoScale(360),
                            const ResponsiveBreakpoint.autoScale(480,
                                name: MOBILE),
                            const ResponsiveBreakpoint.resize(640,
                                name: 'MOBILE_LARGE'),
                            const ResponsiveBreakpoint.resize(850,
                                name: TABLET),
                            const ResponsiveBreakpoint.resize(1080,
                                name: DESKTOP),
                            const ResponsiveBreakpoint.resize(1440,
                                name: 'DESKTOP_LARGE'),
                            const ResponsiveBreakpoint.resize(2460, name: '4k'),
                          ],
                        ));
              },
            );
          }),
        ),
      ),
    );
  }
}
