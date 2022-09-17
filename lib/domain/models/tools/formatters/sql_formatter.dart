import 'package:devtoys/domain/formatters/sql_formatter.dart';
import 'package:devtoys/domain/models/categories/category.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SQLFormatterTool implements Tool{
  @override
  IconData get icon => FontAwesomeIcons.database;

  @override
  String get name => "sql_formatter".tr;
  @override
  // TODO: implement category
  Category get category => throw UnimplementedError();

  @override
  String get route => Routes.sqlFormatter;
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  final SQLFormatter formatter;

  SQLFormatterTool(this.formatter);
}