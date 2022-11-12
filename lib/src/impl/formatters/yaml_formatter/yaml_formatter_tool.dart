import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/formatters/formatters_group.dart';
import 'package:dev_widgets/src/impl/formatters/yaml_formatter/yaml_formatter_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class YamlFormatterTool implements Tool {
  const YamlFormatterTool() : super();

  @override
  IconData get icon => Icons.short_text;

  @override
  String get fullTitle => "yaml_formatter".tr();

  @override
  String get route => Routes.yamlFormatter;

  @override
  Group get group => const FormattersGroup();

  @override
  String get description => "yaml_formatter_description".tr();

  @override
  String get name => "yamlformat";

  @override
  String get shortTitle => "yaml_formatter_short_title".tr();

  @override
  Widget get page => const YamlFormatterPage();
}
