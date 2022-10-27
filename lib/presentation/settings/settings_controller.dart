import 'package:dev_widgets/infrastructure/locale/translations.dart';
import 'package:dev_widgets/infrastructure/global_settings.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/presentation/widgets/io_editor/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaru/yaru.dart';

class SettingsController extends GetxController {
  List<DropdownMenuItem<String>> getLanguageDropdownMenuItems() {
    return DevWidgetsTranslations.supportedLocales
        .map((l) => DropdownMenuItem(
              value: l.localeKey,
              child: Text(l.name),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> getTextEditorThemeDropdownMenuItems() {
    return textEditorThemes.entries
        .map((e) => DropdownMenuItem(
              value: e.key,
              child: Text(e.key),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> getTextEditorFontFamilyDropdownMenuItems() {
    return supportedFontFamilies
        .map((family) => DropdownMenuItem(
              value: family,
              child: Text(family),
            ))
        .toList();
  }

  Future updateLocale(String? value) async =>
      await GlobalSettings.setLocale(value ?? "en_US");

  ThemeMode getThemeMode() => GlobalSettings.getThemeMode();

  setThemeMode(ThemeMode? value) async =>
      await GlobalSettings.setThemeMode(value ?? ThemeMode.system);

  YaruVariant getYaruVariant() => GlobalSettings.getYaruVariant();

  Future setYaruVariant(YaruVariant value) async =>
      await GlobalSettings.setYaruVariant(value);

  bool getHighContrast() => GlobalSettings.getHighContrast();

  Future setHighContrast(bool value) async =>
      await GlobalSettings.setHighContrast(value);

  String? getTextEditorTheme() => GlobalSettings.getTextEditorTheme();
  Future setTextEditorTheme(String? value) async =>
      await GlobalSettings.setTextEditorTheme(value);

  double getTextEditorFontSize() => GlobalSettings.getTextEditorFontSize();

  Future setTextEditorFontSize(double? value) async =>
      await GlobalSettings.setTextEditorFontSize(value ?? 18);

  String getTextEditorFontFamily() => GlobalSettings.getTextEditorFontFamily();

  Future setTextEditorFontFamily(String? value) async =>
      await GlobalSettings.setTextEditorFontFamily(value);
}
