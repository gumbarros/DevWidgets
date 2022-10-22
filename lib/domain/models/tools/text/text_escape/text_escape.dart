import 'package:devtoys/domain/helpers/text/text_escaper.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEscapeTool implements Tool {
  @override
  IconData get icon => Icons.text_format;

  @override
  String get homeTitle => "text_escape".tr;

  @override
  String get route => Routes.textEscape;

  @override
  String get description => "text_escape_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get name => "escape";

  @override
  String get menuTitle => "text_escape_menu_name".tr;

  TextEscaper get escaper => TextEscaper();
}
