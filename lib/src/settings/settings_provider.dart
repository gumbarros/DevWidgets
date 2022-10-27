import 'package:dev_widgets/src/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

final _settingsBox = Hive.box("settings");

Settings loadSettingsFromBox() {
  final settings =
      Settings(themeMode: ThemeMode.values[_settingsBox.get("themeMode") ?? 0]);

  return settings;
}

class SettingsNotifer extends StateNotifier<Settings> {
  SettingsNotifer() : super(loadSettingsFromBox());

  setThemeMode(ThemeMode themeMode) async {
    _settingsBox.put("themeMode", themeMode.index);
    state = state.copyWith(themeMode: themeMode);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifer, Settings>((ref) {
  return SettingsNotifer();
});
