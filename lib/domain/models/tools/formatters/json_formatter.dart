import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class JsonFormatterTool implements Tool{
  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "json_formatter".tr;
  
  @override
  // TODO: implement route
  String get route => throw UnimplementedError();
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();
}