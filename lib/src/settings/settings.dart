import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

@immutable
class Settings {
  final bool isCompactMode;
  final String selectedToolName;

  final String favorites;

  final ThemeMode themeMode;
  final bool highContrast;
  final YaruVariant yaruVariant;
  final String textEditorTheme;

  final double textEditorFontSize;
  final String textEditorFontFamily;

  const Settings(
      {this.isCompactMode = false,
      this.selectedToolName = "home",
      this.favorites = "",
      this.themeMode = ThemeMode.system,
      this.highContrast = false,
      this.yaruVariant = YaruVariant.orange,
      this.textEditorTheme = "vs",
      this.textEditorFontSize = 18,
      this.textEditorFontFamily = "Hack"});

  Settings copyWith({ThemeMode? themeMode}) {
    return Settings(themeMode: themeMode ?? this.themeMode);
  }
}
