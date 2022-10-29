import 'package:dev_widgets/src/impl/domain/formatters/xml_formatter.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/formatters_group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
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
  Group get group => FormattersGroup();

  @override
  String get name => "xmlformat";

  XmlFormatter get formatter => XmlFormatter();

  @override
  String get menuTitle => "xml_formatter_menu_name".tr();
}
