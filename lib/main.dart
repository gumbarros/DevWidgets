import 'package:dev_widgets/src/router.dart';
import 'package:dev_widgets/src/supported_locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> ensureInitialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  EasyLocalization.logger.enableLevels = [];
  await EasyLocalization.ensureInitialized();
}

Future<void> main() async {
  await ensureInitialized();

  runApp(ProviderScope(
      child: EasyLocalization(
          path: 'assets/translations',
          assetLoader: const YamlAssetLoader(),
          fallbackLocale: const Locale("en", "US"),
          supportedLocales: supportedLocales.map((l) => l.locale).toList(),
          child: const Main())));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "DevWidgets",
    );
  }
}
