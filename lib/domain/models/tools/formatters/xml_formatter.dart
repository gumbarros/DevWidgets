import 'package:devtoys/domain/models/categories/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class XmlFormatterTool implements Tool{
  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "xml_formatter".tr;
  
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