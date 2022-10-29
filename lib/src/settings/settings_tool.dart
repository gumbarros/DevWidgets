import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/home/home_group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
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
  String get description => "settings_description".tr();

  @override
  String get name => "settings";

  @override
  String get menuTitle => "settings_menu_name".tr();
}
