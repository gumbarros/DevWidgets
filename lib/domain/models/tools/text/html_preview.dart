import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/text_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HtmlPreviewTool implements Tool {
  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "html_preview".tr;

  @override
  String get route => Routes.htmlPreview;

  @override
  String get description => "html_preview_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get name => "htmlpreview";

  @override
  String get menuTitle => "html_preview_menu_name".tr;
}
