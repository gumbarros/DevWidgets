import 'package:devtoys/domain/helpers/converters/json_to_class/json_to_class_converter.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsonToClassConverterTool implements Tool {
  @override
  IconData get icon => Icons.data_object;

  @override
  String get homeTitle => "json_to_class".tr;

  @override
  String get route => Routes.jsonToClass;

  @override
  String get description => "json_to_class_description".tr;

  @override
  Group get group => ConvertersGroup();

  @override
  String get commandLineArgName => "jsonToClass";

  @override
  String get menuName => "json_to_class".tr;

  JsonToClassConverter get converter => JsonToClassConverter();
}
