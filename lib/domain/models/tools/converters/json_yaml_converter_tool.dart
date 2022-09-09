import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class JsonYamlConverterTool implements Tool{
  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "json_yaml_converter".tr;
  
  @override
  // TODO: implement route
  String get route => throw UnimplementedError();
  
  @override
  // TODO: implement description
  String get description => throw UnimplementedError();
}