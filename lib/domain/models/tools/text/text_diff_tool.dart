import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TextDiffTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.plusMinus;

  @override
  String get homeTitle => "text_diff".tr;

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get commandLineArgName => "diff";

  TextDiffTool();

  @override
  String get menuName => "text_diff_menu_name".tr;
}
