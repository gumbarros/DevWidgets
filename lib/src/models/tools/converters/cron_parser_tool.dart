import 'package:dev_widgets/src/models/groups/converters_group.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CronParserTool implements Tool {
  @override
  IconData get icon => Icons.schedule;

  @override
  String get homeTitle => "cron_parser".tr;

  @override
  String get route => Routes.cronParser;

  @override
  String get description => "cron_parser_description".tr;

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "cron-parser";

  @override
  String get menuTitle => throw UnimplementedError();
}
