import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/formatters/formatters_group.dart';
import 'package:dev_widgets/src/impl/formatters/sql_formatter/sql_formatter_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class SqlFormatterTool implements Tool {
  const SqlFormatterTool() : super();

  @override
  IconData get icon => Icons.storage;

  @override
  String get fullTitle => "sql_formatter".tr();

  @override
  Group get group => FormattersGroup();

  @override
  String get route => Routes.sqlFormatter;

  @override
  String get description => "sql_formatter_description".tr();

  @override
  String get name => "sqlformat";

  @override
  String get shortTitle => "sql_formatter_short_title".tr();

  @override
  Widget get page => const SqlFormatterPage();
}
