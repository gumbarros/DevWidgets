import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/text/text_group.dart';
import 'package:dev_widgets/src/impl/text/text_inspector/text_inspector_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextInspectorTool implements Tool {
  const TextInspectorTool() : super();

  @override
  IconData get icon => Icons.zoom_in;

  @override
  String get fullTitle => "text_inspector".tr();

  @override
  String get route => Routes.textInspector;

  @override
  String get description => "text_inspector_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "textInspector";

  @override
  String get shortTitle => "text_inspector_short_title".tr();

  @override
  Widget get page => const TextInspectorPage();
}
