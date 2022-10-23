import 'package:dev_widgets/domain/helpers/formatters/xml_formatter.dart';
import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/formatters_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XmlFormatterTool implements Tool {
  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "xml_formatter".tr;

  @override
  String get route => Routes.xmlFormatter;

  @override
  String get description => "xml_formatter_description".tr;

  @override
  Group get group => FormattersGroup();

  @override
  String get name => "xmlformat";

  XmlFormatter get formatter => XmlFormatter();

  @override
  String get menuTitle => "xml_formatter_menu_name".tr;
}
