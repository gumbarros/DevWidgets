import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CronParserTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.clock;

  @override
  String get name => "cron_parser".tr;

  @override
  String get route => Routes.cronParser;

  @override
  String get description => "cron_parser_description".tr;

  @override
  Group get group => ConvertersGroup();
}
