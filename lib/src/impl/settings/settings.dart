import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

@immutable
class Settings {
  final List<String> favorites;

  final ThemeMode themeMode;
  final bool highContrast;
  final YaruVariant yaruVariant;
  final String textEditorTheme;

  final double textEditorFontSize;
  final String textEditorFontFamily;
  final bool textEditorWrap;

  final bool textEditorDisplayLineNumbers;

  const Settings(
      {this.favorites = const [],
      this.themeMode = ThemeMode.system,
      this.highContrast = false,
      this.yaruVariant = YaruVariant.orange,
      this.textEditorWrap = false,
      this.textEditorTheme = "vs2015",
      this.textEditorFontSize = 18,
      this.textEditorDisplayLineNumbers = true,
      this.textEditorFontFamily = "Hack"});

  Settings copyWith(
      {List<String>? favorites,
      ThemeMode? themeMode,
      bool? highContrast,
      YaruVariant? yaruVariant,
      String? textEditorTheme,
      bool? textEditorWrap,
      double? textEditorFontSize,
      bool? textEditorDisplayLineNumbers,
      String? textEditorFontFamily}) {
    return Settings(
        themeMode: themeMode ?? this.themeMode,
        favorites: favorites ?? this.favorites,
        highContrast: highContrast ?? this.highContrast,
        textEditorWrap: textEditorWrap ?? this.textEditorWrap,
        textEditorFontFamily: textEditorFontFamily ?? this.textEditorFontFamily,
        textEditorFontSize: textEditorFontSize ?? this.textEditorFontSize,
        textEditorDisplayLineNumbers:
            textEditorDisplayLineNumbers ?? this.textEditorDisplayLineNumbers,
        textEditorTheme: textEditorTheme ?? this.textEditorTheme,
        yaruVariant: yaruVariant ?? this.yaruVariant);
  }
}
