import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/converters_group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class NumberBaseConverterTool implements Tool {
  @override
  IconData get icon => Icons.numbers;

  @override
  String get homeTitle => "number_base_converter".tr();

  @override
  String get route => Routes.numberBase;

  @override
  String get description => "number_base_converter_description".tr();

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "number-base";

  @override
  String get menuTitle => throw UnimplementedError();
}
