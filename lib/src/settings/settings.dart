import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

@immutable
class Settings {
  final List<String> favorites;

  final Locale locale;

  final ThemeMode themeMode;
  final bool highContrast;
  final YaruVariant yaruVariant;
  final String textEditorTheme;

  final double textEditorFontSize;
  final String textEditorFontFamily;

  const Settings(
      {this.favorites = const [],
      this.themeMode = ThemeMode.system,
      this.locale = const Locale("en_US"),
      this.highContrast = false,
      this.yaruVariant = YaruVariant.orange,
      this.textEditorTheme = "vs",
      this.textEditorFontSize = 18,
      this.textEditorFontFamily = "Hack"});

  Settings copyWith(
      {List<String>? favorites,
      ThemeMode? themeMode,
      Locale? locale,
      bool? highContrast,
      YaruVariant? yaruVariant,
      String? textEditorTheme,
      double? textEditorFontSize,
      String? textEditorFontFamily}) {
    return Settings(
        themeMode: themeMode ?? this.themeMode,
        favorites: favorites ?? this.favorites,
        locale: locale ?? this.locale,
        highContrast: highContrast ?? this.highContrast,
        textEditorFontFamily: textEditorFontFamily ?? this.textEditorFontFamily,
        textEditorFontSize: textEditorFontSize ?? this.textEditorFontSize,
        textEditorTheme: textEditorTheme ?? this.textEditorTheme,
        yaruVariant: yaruVariant ?? this.yaruVariant);
  }
}
