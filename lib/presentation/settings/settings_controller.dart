import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yaru/yaru.dart';

class SettingsController extends GetxController {
  final storage = GetStorage();

  getLanguageDropdownMenuItems() {
    return DevToysTranslations.supportedLocales
        .map((l) => DropdownMenuItem(
              child: Text(l.name),
              value: l.localeKey,
            ))
        .toList();
  }

  updateLocale(String? value) async {
    await GlobalSettings.setLocale(value ?? "en_US");
  }

  setThemeMode(ThemeMode? value) async {
    await GlobalSettings.setThemeMode(value ?? ThemeMode.system);
  }

  setYaruVariant(YaruVariant value) async {
    await GlobalSettings.setYaruVariant(value);
  }
}
