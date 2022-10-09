import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/home_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SettingsTool implements Tool {
  static final SettingsTool _singleton = SettingsTool._internal();

  factory SettingsTool() {
    return _singleton;
  }

  SettingsTool._internal();

  @override
  IconData get icon => FontAwesomeIcons.xmark;

  @override
  String get homeTitle => "settings".tr;

  @override
  String get route => Routes.settings;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "settings_description".tr;

  @override
  String get commandLineArgName => "settings";

  @override
  String get menuName => "settings_menu_name".tr;
}
