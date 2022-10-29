import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/formatters/formatters_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonFormatterTool implements Tool {
  const JsonFormatterTool() : super();

  @override
  IconData get icon => Icons.data_object;

  @override
  String get homeTitle => "json_formatter".tr();

  @override
  String get route => Routes.jsonFormatter;

  @override
  Group get group => FormattersGroup();

  @override
  String get description => "json_formatter_description".tr();

  @override
  String get name => "jsonformat";

  @override
  String get menuTitle => "json_formatter_menu_name".tr();
}
