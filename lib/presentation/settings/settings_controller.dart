import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/presentation/global_variables.dart';
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
              value: l.locale,
            ))
        .toList();
  }

  updateLocale(String? value) async {
    await Get.updateLocale(Locale(value ?? "en_US"));
    await storage.write("locale", value);
  }

  updateThemeMode(ThemeMode? value) async {
    GlobalVariables.themeMode.value = value ?? ThemeMode.system;
    await storage.write("themeMode", value?.index);
  }

  updateYaruVariant(YaruVariant value) async {
    GlobalVariables.yaruVariant.value = value;
    //TODO: serialize yaruVariant
    // await storage.write("yaruVariant", value);
  }
}
