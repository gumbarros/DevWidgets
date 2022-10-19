import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SQLFormatterTool extends FormatterTool implements Tool {
  SQLFormatterTool(super.formatter);

  @override
  IconData get icon => Icons.storage;

  @override
  String get homeTitle => "sql_formatter".tr;

  @override
  Group get group => FormattersGroup();

  @override
  String get route => Routes.sqlFormatter;

  @override
  String get description => "sql_formatter_description".tr;

  @override
  String get name => "sqlformat";

  @override
  String get menuTitle => "sql_formatter_menu_name".tr;
}
