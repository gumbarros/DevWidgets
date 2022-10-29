import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/converters/converters_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class JsonYamlConverterTool implements Tool {
  const JsonYamlConverterTool() : super();

  @override
  IconData get icon => Icons.compare_arrows;

  @override
  String get homeTitle => "json_yaml_converter".tr();

  @override
  String get route => Routes.jsonYamlConverter;

  @override
  String get description => "json_yaml_converter_description".tr();

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "jsonYaml";

  @override
  String get menuTitle => "json_yaml_converter".tr();
}
