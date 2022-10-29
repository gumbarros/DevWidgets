import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/text/text_group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class TextDiffTool implements Tool {
  const TextDiffTool() : super();

  @override
  IconData get icon => Icons.difference;

  @override
  String get homeTitle => "text_diff".tr();

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "diff";

  @override
  String get menuTitle => "text_diff_menu_name".tr();
}