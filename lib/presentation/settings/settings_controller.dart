import 'package:devtoys/infrastructure/locale/translations.dart';
import 'package:devtoys/presentation/global_settings.dart';
import 'package:devtoys/presentation/widgets/io_editor/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yaru/yaru.dart';

class SettingsController extends GetxController {
  final storage = GetStorage();

  List<DropdownMenuItem<String>> getLanguageDropdownMenuItems() {
    return DevToysTranslations.supportedLocales
        .map((l) => DropdownMenuItem(
              child: Text(l.name),
              value: l.localeKey,
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> getTextEditorThemeDropdownMenuItems() {
    return kTextEditorThemes.entries
        .map((e) => DropdownMenuItem(
              child: Text(e.key),
              value: e.key,
            ))
        .toList();
  }

  Future updateLocale(String? value) async =>
      await GlobalSettings.setLocale(value ?? "en_US");

  ThemeMode getThemeMode() => GlobalSettings.getThemeMode().value;

  Future setThemeMode(ThemeMode? value) async =>
      await GlobalSettings.setThemeMode(value ?? ThemeMode.system);

  YaruVariant getYaruVariant() => GlobalSettings.getYaruVariant().value;

  Future setYaruVariant(YaruVariant value) async =>
      await GlobalSettings.setYaruVariant(value);

  bool getHighContrast() => GlobalSettings.getHighContrast().value;

  Future setHighContrast(bool value) async =>
      await GlobalSettings.setHighContrast(value);

  Future setTextEditorTheme(String? value) async =>
      await GlobalSettings.setTextEditorTheme(value);

  String? getTextEditorTheme() => GlobalSettings.getTextEditorTheme().value;

  Future setTextEditorFontSize(double? value) async =>
      await GlobalSettings.setTextEditorFontSize(value ?? 18);

  double getTextEditorFontSize() =>
      GlobalSettings.getTextEditorFontSize().value;
}
