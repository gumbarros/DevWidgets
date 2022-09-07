
import 'package:devtoys/domain/tools/json_yaml_converter_tool.dart';
import 'package:devtoys/domain/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category.dart';

class ConvertersCategory implements Category{

  static final ConvertersCategory _singleton = ConvertersCategory._internal();

  factory ConvertersCategory() {
    return _singleton;
  }

  ConvertersCategory._internal();
  
  @override
  IconData get icon => Icons.abc;

  @override
  String get name => "converters".tr;

  @override
  List<Tool> get tools => [JsonYamlConverterTool()];
}