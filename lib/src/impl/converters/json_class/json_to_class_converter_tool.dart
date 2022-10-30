import 'package:dev_widgets/src/impl/converters/converters_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/converters/json_class/json_to_class_converter_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
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

  @override
  Widget get page => const JsonToClassConverterPage();
}
