import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class XmlFormatterTool extends FormatterTool implements Tool {
  XmlFormatterTool(super.formatter);

  @override
  IconData get icon => FontAwesomeIcons.code;

  @override
  String get name => "xml_formatter".tr;

  @override
  String get route => Routes.xmlFormatter;

  @override
  String get description => "xml_formatter_description".tr;

  @override
  Group get group => FormattersGroup();
}
