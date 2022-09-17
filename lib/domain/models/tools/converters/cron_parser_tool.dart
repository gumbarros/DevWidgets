import 'package:devtoys/domain/models/categories/category.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CronParserTool implements Tool{
  @override
  IconData get icon => FontAwesomeIcons.clock;

  @override
  String get name => "cron_parser".tr;
  
  @override
  // TODO: implement route
  String get route => throw UnimplementedError();
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();

  @override
  // TODO: implement category
  Category get category => throw UnimplementedError();
}