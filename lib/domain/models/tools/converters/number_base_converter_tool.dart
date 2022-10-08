import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberBaseConverterTool implements Tool {
  @override
  IconData get icon => Icons.numbers;

  @override
  String get homeTitle => "number_base_converter".tr;

  @override
  String get route => Routes.numberBase;

  @override
  String get description => "number_base_converter_description".tr;

  @override
  Group get group => ConvertersGroup();

  @override
  String get commandLineArgName => "number-base";

  @override
  String get menuName => throw UnimplementedError();
}
