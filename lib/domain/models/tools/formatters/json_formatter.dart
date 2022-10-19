import 'package:devtoys/domain/helpers/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tool.dart';

class JsonFormatterTool extends FormatterTool implements Tool {
  JsonFormatterTool(this.formatter) : super(formatter);

  @override
  IconData get icon => Icons.data_object;

  @override
  String get homeTitle => "json_formatter".tr;

  @override
  String get route => Routes.JsonFormatter;

  @override
  Group get group => FormattersGroup();

  @override
  String get description => "json_formatter_description".tr;

  @override
  final JsonFormatter formatter;

  @override
  String get name => "jsonformat";

  @override
  String get menuTitle => "json_formatter_menu_name".tr;
}
