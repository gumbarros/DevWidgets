import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/formatters/formatters_group.dart';
import 'package:dev_widgets/src/impl/formatters/json_formatter/json_formatter_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonFormatterTool implements Tool {
  const JsonFormatterTool() : super();

  @override
  IconData get icon => Icons.data_object;

  @override
  String get fullTitle => "json_formatter".tr();

  @override
  String get route => Routes.jsonFormatter;

  @override
  Group get group => const FormattersGroup();

  @override
  String get description => "json_formatter_description".tr();

  @override
  String get name => "jsonformat";

  @override
  String get shortTitle => "json_formatter_short_title".tr();

  @override
  Widget get page => const JsonFormatterPage();
}
