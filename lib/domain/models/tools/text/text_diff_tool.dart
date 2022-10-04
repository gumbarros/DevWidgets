import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextDiffTool implements Tool {
  @override
  IconData get icon => Icons.difference;

  @override
  String get name => "text_diff".tr;

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get commandLineArgName => "diff";

  TextDiffTool();
}
