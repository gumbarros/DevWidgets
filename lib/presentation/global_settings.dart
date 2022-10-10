import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yaru/yaru.dart';
import 'dart:ui' as ui;

class GlobalSettings {
  static final GetStorage _getStorage = GetStorage();

  static final Rx<bool> compactMode = false.obs;
  static final Rx<String> selectedToolName = (HomeTool).toString().obs;

  static Rx<ThemeMode>? _themeMode;
  static Rx<YaruVariant>? _yaruVariant;

  static Rx<ThemeMode> getThemeMode() {
    if (_themeMode == null) {
      final storedValue = _getStorage.read("themeMode");
      _themeMode = ThemeMode.values[storedValue ?? ThemeMode.system.index].obs;
    }

    return _themeMode!;
  }

  static setThemeMode(ThemeMode mode) async {
    await _getStorage.write("themeMode", mode.index);

    Get.changeThemeMode(mode);

    _themeMode!.value = mode;
  }

  static Rx<YaruVariant> getYaruVariant() {
    if (_yaruVariant == null) {
      final storedValue = _getStorage.read("yaruVariant");
      _yaruVariant =
          YaruVariant.values[storedValue ?? YaruVariant.orange.index].obs;
    }

    return _yaruVariant!;
  }

  static setYaruVariant(YaruVariant variant) async {
    _getStorage.write("yaruVariant", variant.index);

    _yaruVariant!.value = variant;
  }

  static getLocale() {
    String localeCode =
        GetStorage().read("locale") ?? ui.window.locale.languageCode;

    return Locale(localeCode);
  }

  static setLocale(String locale) async {
    await Get.updateLocale(Locale(locale));
    await _getStorage.write("locale", locale);
  }
}

const List<YaruVariant> yaruVariantList = [
  YaruVariant.orange,
  YaruVariant.sage,
  YaruVariant.bark,
  YaruVariant.olive,
  YaruVariant.viridian,
  YaruVariant.prussianGreen,
  YaruVariant.blue,
  YaruVariant.purple,
  YaruVariant.magenta,
  YaruVariant.red,
];
