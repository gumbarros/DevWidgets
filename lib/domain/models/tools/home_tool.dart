import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/home_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeTool implements Tool {
  static final HomeTool _singleton = HomeTool._internal();

  factory HomeTool() {
    return _singleton;
  }

  HomeTool._internal();

  @override
  IconData get icon => Icons.home;

  @override
  String get homeTitle => "all_tools".tr;

  @override
  String get route => Routes.home;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "json_formatter_description".tr;

  @override
  String get name => "home";

  @override
  String get menuTitle => "all_tools".tr;
}
