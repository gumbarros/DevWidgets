import 'package:devtoys/domain/helpers/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../tool.dart';

class JSONFormatterTool extends FormatterTool implements Tool {
  JSONFormatterTool(this.formatter) : super(formatter);

  @override
  IconData get icon => FontAwesomeIcons.alignLeft;

  @override
  String get homeTitle => "json_formatter".tr;

  @override
  String get route => Routes.jsonFormatter;

  @override
  Group get group => FormattersGroup();

  @override
  String get description => "json_formatter_description".tr;

  @override
  final JSONFormatter formatter;

  @override
  String get commandLineArgName => "jsonformat";

  @override
  String get menuName => "json_formatter_menu_name".tr;
}
