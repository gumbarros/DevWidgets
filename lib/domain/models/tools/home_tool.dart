import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/home_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.alignLeft;

  @override
  String get name => "home".tr;

  @override
  String get route => Routes.home;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "json_formatter_description".tr;

  @override
  String get commandLineArgName => "home";
}
