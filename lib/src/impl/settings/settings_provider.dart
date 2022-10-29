import 'package:dev_widgets/src/impl/settings/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yaru/yaru.dart';

final _settingsBox = Hive.box("settings");

Settings loadSettingsFromBox() {
  final settings = Settings(
      textEditorFontFamily:
          _settingsBox.get("textEditorFontFamily", defaultValue: 'Hack'),
      highContrast: _settingsBox.get("highContrast", defaultValue: false),
      textEditorFontSize:
          _settingsBox.get("textEditorFontSize", defaultValue: 18.0),
      textEditorTheme: _settingsBox.get("textEditorTheme", defaultValue: "vs"),
      favorites: _settingsBox.get("favorites", defaultValue: <String>[]),
      themeMode:
          ThemeMode.values[_settingsBox.get("themeMode", defaultValue: 0)],
      yaruVariant:
          YaruVariant.values[_settingsBox.get("yaruVariant", defaultValue: 0)]);

  return settings;
}

class SettingsNotifer extends StateNotifier<Settings> {
  SettingsNotifer() : super(loadSettingsFromBox());

  void setThemeMode(ThemeMode themeMode) async {
    _settingsBox.put("themeMode", themeMode.index);
    state = state.copyWith(themeMode: themeMode);
  }

  void setTextEditorFontFamily(String fontFamily) {
    _settingsBox.put("textEditorFontFamily", fontFamily);
    state = state.copyWith(textEditorFontFamily: fontFamily);
  }

  void setTextEditorFontSize(double fontSize) {
    _settingsBox.put("textEditorFontSize", fontSize);
    state = state.copyWith(textEditorFontSize: fontSize);
  }

  void setTextEditorTheme(String theme) {
    _settingsBox.put("textEditorTheme", theme);
    state = state.copyWith(textEditorTheme: theme);
  }

  void setYaruVariant(YaruVariant variant) {
    _settingsBox.put("yaruVariant", variant.index);
    state = state.copyWith(yaruVariant: variant);
  }

  void setHighContrast(bool isHighContrast) {
    _settingsBox.put("highContrast", isHighContrast);
    state = state.copyWith(highContrast: isHighContrast);
  }

  void setLocale(BuildContext context, Locale locale) {
    context.setLocale(locale);
    state = state.copyWith(locale: locale);
  }

  void addFavorite(String name) {
    final favorites = state.favorites;
    favorites.add(name);
    _settingsBox.put("favorites", favorites);
    state = state.copyWith(favorites: favorites);
  }

  void removeFavorite(String name) {
    final favorites = state.favorites;
    favorites.remove(name);
    _settingsBox.put("favorites", favorites);
    state = state.copyWith(favorites: favorites);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifer, Settings>((ref) {
  return SettingsNotifer();
});
