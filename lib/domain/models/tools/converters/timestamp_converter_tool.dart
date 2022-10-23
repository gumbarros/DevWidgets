import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/converters_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TimestampConverterTool implements Tool {
  @override
  IconData get icon => Icons.schedule;

  @override
  String get homeTitle => "timestamp_converter".tr;

  @override
  String get route => Routes.timestampConverter;

  @override
  String get description => "timestamp_converter_description".tr;

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "timestamp";

  @override
  String get menuTitle => throw UnimplementedError();
}
