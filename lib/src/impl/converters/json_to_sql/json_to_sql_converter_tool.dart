import 'package:dev_widgets/src/impl/converters/converters_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/converters/json_to_sql/page/json_to_sql_converter_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToSqlConverterTool implements Tool {
  const JsonToSqlConverterTool() : super();

  @override
  IconData get icon => Icons.storage;

  @override
  String get fullTitle => "json_to_sql".tr();

  @override
  String get route => Routes.jsonToSql;

  @override
  String get description => "json_to_sql_description".tr();

  @override
  Group get group => const ConvertersGroup();

  @override
  String get name => "jsonToSql";

  @override
  String get shortTitle => "json_to_sql".tr();

  @override
  Widget get page => const JsonToSqlConverterPage();
}
