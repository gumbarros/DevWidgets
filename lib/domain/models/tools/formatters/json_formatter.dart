import 'package:devtoys/domain/formatters/json_formatter.dart';
import 'package:devtoys/domain/models/categories/category.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class JSONFormatterTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.js;

  @override
  String get name => "json_formatter".tr;

  @override
  String get route => Routes.jsonFormatter;

  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement category
  Category get category => throw UnimplementedError();

  final JSONFormatter formatter;

  JSONFormatterTool(this.formatter);
}
