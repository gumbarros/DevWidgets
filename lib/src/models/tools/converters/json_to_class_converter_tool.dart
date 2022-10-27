import 'package:dev_widgets/domain/helpers/converters/json_to_class/json_to_class_converter.dart';
import 'package:dev_widgets/src/models/groups/converters_group.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
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
  String get name => "jsonToClass";

  @override
  String get menuTitle => "json_to_class".tr;

  JsonToClassConverter get converter => JsonToClassConverter();
}
