import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/home/home_group.dart';
import 'package:dev_widgets/src/impl/settings/settings_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class SettingsTool implements Tool {
  const SettingsTool() : super();

  @override
  IconData get icon => Icons.settings;

  @override
  String get homeTitle => "settings".tr();

  @override
  String get route => Routes.settings;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "settings".tr();

  @override
  String get name => "settings";

  @override
  String get menuTitle => "settings_menu_name".tr();

  @override
  Widget get page => const SettingsPage();
}
