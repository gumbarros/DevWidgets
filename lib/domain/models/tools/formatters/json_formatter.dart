import 'package:devtoys/domain/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../tool.dart';

class JSONFormatterTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.alignLeft;

  @override
  String get name => "json_formatter".tr;

  @override
  String get route => Routes.jsonFormatter;

  @override
  Group get group => FormattersGroup();

  @override
  String get description => "json_formatter_description".tr;

  final JSONFormatter formatter;

  JSONFormatterTool(this.formatter);
}
