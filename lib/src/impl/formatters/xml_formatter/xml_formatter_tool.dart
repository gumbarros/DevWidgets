import 'package:dev_widgets/src/impl/formatters/xml_formatter/xml_formatter_page.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/formatters/formatters_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class XmlFormatterTool implements Tool {
  const XmlFormatterTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "xml_formatter".tr();

  @override
  String get route => Routes.xmlFormatter;

  @override
  String get description => "xml_formatter_description".tr();

  @override
  String get name => "xmlformat";

  @override
  String get menuTitle => "xml_formatter_menu_name".tr();

  @override
  Group get group => FormattersGroup();

  @override
  Widget get page => const XmlFormatterPage();
}
