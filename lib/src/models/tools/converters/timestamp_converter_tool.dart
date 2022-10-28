import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/converters_group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class TimestampConverterTool implements Tool {
  @override
  IconData get icon => Icons.schedule;

  @override
  String get homeTitle => "timestamp_converter".tr();

  @override
  String get route => Routes.timestampConverter;

  @override
  String get description => "timestamp_converter_description".tr();

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "timestamp";

  @override
  String get menuTitle => throw UnimplementedError();
}
