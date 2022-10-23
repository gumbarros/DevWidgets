import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/text_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TextDiffTool implements Tool {
  @override
  IconData get icon => Icons.difference;

  @override
  String get homeTitle => "text_diff".tr;

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get name => "diff";

  TextDiffTool();

  @override
  String get menuTitle => "text_diff_menu_name".tr;
}
