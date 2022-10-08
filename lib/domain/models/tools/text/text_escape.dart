import 'package:devtoys/domain/helpers/text/text_escaper.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class TextEscapeTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.textSlash;

  @override
  String get title => "text_escape".tr;

  @override
  String get route => Routes.textEscape;

  @override
  String get description => "text_escape_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get commandLineArgName => "escape";

  final TextEscaper escaper;

  TextEscapeTool(this.escaper);
}
