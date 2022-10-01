import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonYamlConverterTool implements Tool {
  @override
  IconData get icon => Icons.data_object;

  @override
  String get name => "json_yaml_converter".tr;

  @override
  String get route => Routes.jsonYamlConverter;

  @override
  String get description => "json_yaml_converter_description".tr;

  @override
  Group get group => ConvertersGroup();
}
