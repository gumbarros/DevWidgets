import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/home_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsTool implements Tool {
  static final SettingsTool _singleton = SettingsTool._internal();

  factory SettingsTool() {
    return _singleton;
  }

  SettingsTool._internal();

  @override
  IconData get icon => Icons.settings;

  @override
  String get homeTitle => "settings".tr;

  @override
  String get route => Routes.settings;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "settings_description".tr;

  @override
  String get name => "settings";

  @override
  String get menuTitle => "settings_menu_name".tr;
}
