import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SQLFormatterTool extends FormatterTool implements Tool {
  SQLFormatterTool(super.formatter);

  @override
  IconData get icon => FontAwesomeIcons.database;

  @override
  String get name => "sql_formatter".tr;

  @override
  Group get group => FormattersGroup();

  @override
  String get route => Routes.sqlFormatter;

  @override
  String get description => "sql_formatter_description".tr;

  @override
  String get commandLineArgName => "sqlformat";
}
