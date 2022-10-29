import 'package:dev_widgets/src/converters/converters_group.dart';
import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class JsonToClassConverterTool implements Tool {
  const JsonToClassConverterTool() : super();

  @override
  IconData get icon => Icons.data_object;

  @override
  String get homeTitle => "json_to_class".tr();

  @override
  String get route => Routes.jsonToClass;

  @override
  String get description => "json_to_class_description".tr();

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "jsonToClass";

  @override
  String get menuTitle => "json_to_class".tr();
}
