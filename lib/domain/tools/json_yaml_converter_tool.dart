import 'package:devtoys/domain/tools/tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonYamlConverterTool implements Tool{
  @override
  IconData get icon => Icons.ac_unit_outlined;

  @override
  String get name => "json_yaml_converter".tr;
}