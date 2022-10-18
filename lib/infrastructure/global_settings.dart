import 'package:devtoys/domain/models/tools/home_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/bindings/domains/tools_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yaru/yaru.dart';
import 'dart:ui' as ui;

class GlobalSettings {
  static final GetStorage _getStorage = GetStorage();

  static final Rx<bool> compactMode = false.obs;
  static final Rx<String> selectedToolName = (HomeTool).toString().obs;

  static RxList<String>? _favorites;

  static Rx<ThemeMode>? _themeMode;
  static Rx<bool>? _highContrast;
  static Rx<YaruVariant>? _yaruVariant;
  static Rx<String?>? _textEditorTheme;

  static Rx<double>? _textEditorFontSize;
  static Rx<String>? _textEditorFontFamily;

  static ThemeMode getThemeMode() {
    if (_themeMode == null) {
      final storedValue = _getStorage.read("themeMode");
      _themeMode = ThemeMode.values[storedValue ?? ThemeMode.system.index].obs;
    }

    return _themeMode!.value;
  }

  static Future setThemeMode(ThemeMode mode) async {
    await _getStorage.write("themeMode", mode.index);

    Get.changeThemeMode(mode);

    _themeMode!.value = mode;
  }

  static YaruVariant getYaruVariant() {
    if (_yaruVariant == null) {
      final storedValue = _getStorage.read("yaruVariant");
      _yaruVariant =
          YaruVariant.values[storedValue ?? YaruVariant.orange.index].obs;
    }

    return _yaruVariant!.value;
  }

  static Future setYaruVariant(YaruVariant variant) async {
    _getStorage.write("yaruVariant", variant.index);

    _yaruVariant!.value = variant;
  }

  static bool getHighContrast() {
    if (_highContrast == null) {
      final bool storedValue = _getStorage.read("highContrast") ?? false;
      _highContrast = storedValue.obs;
    }

    return _highContrast!.value;
  }

  static Future setHighContrast(bool highContrast) async {
    await _getStorage.write("highContrast", highContrast);

    _highContrast!.value = highContrast;
  }

  static getLocale() {
    String localeCode =
        GetStorage().read("locale") ?? ui.window.locale.languageCode;

    return Locale(localeCode);
  }

  static Future setLocale(String locale) async {
    await Get.updateLocale(Locale(locale));
    await _getStorage.write("locale", locale);
  }

  static String? getTextEditorTheme() {
    if (_textEditorTheme == null) {
      _textEditorTheme = (_getStorage.read("textEditorTheme")?.toString()).obs;
    }
    return _textEditorTheme!.value;
  }

  static Future setTextEditorTheme(String? theme) async {
    await _getStorage.write("textEditorTheme", theme);

    _textEditorTheme!.value = theme;
  }

  static double getTextEditorFontSize() {
    if (_textEditorFontSize == null) {
      _textEditorFontSize =
          ((_getStorage.read("textEditorFontSize") ?? 18.0) as double).obs;
    }
    return _textEditorFontSize!.value;
  }

  static Future setTextEditorFontSize(double fontSize) async {
    await _getStorage.write("textEditorFontSize", fontSize);

    _textEditorFontSize!.value = fontSize;
  }

  static String getTextEditorFontFamily() {
    if (_textEditorFontFamily == null) {
      _textEditorFontFamily =
          (_getStorage.read("textEditorFontFamily")?.toString() ?? "Fira Code")
              .obs;
    }
    return _textEditorFontFamily!.value;
  }

  static Future setTextEditorFontFamily(String? fontFamily) async {
    await _getStorage.write("textEditorFontFamily", fontFamily);

    _textEditorFontFamily!.value = fontFamily!;
  }

  static List<Tool> getFavoriteTools() {
    if (_favorites == null) {
      final List<String> storedValue =
          (_getStorage.read("favorites") ?? <String>[]);

      _favorites = storedValue.obs;
    }

    final List<Tool> tools = [];

    for (var toolName in _favorites!) {
      tools.add(ToolsBinding.getToolByName(toolName));
    }

    return tools;
  }

  static RxList<String> _getRxFavorites() {
    if (_favorites == null) {
      final List<String>? storedValue =
          _getStorage.read("favorites")?.cast<String>();

      _favorites = (storedValue ?? []).obs;
    }
    return _favorites!;
  }

  static Future addFavorite(String toolName) async {
    _favorites ??= <String>[].obs;

    _favorites!.add(toolName);
    await _getStorage.write("favorites", _favorites);
  }

  static Future removeFavorite(String toolName) async {
    _favorites ??= <String>[].obs;

    _favorites!.remove(toolName);

    await _getStorage.write("favorites", _favorites);
  }

  static bool isFavorite(String toolName) {
    _favorites ??= _getRxFavorites();

    return _favorites!.contains(toolName);
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
