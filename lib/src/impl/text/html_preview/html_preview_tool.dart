import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/text/html_preview/html_preview_page.dart';
import 'package:dev_widgets/src/impl/text/text_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class HtmlPreviewTool implements Tool {
  const HtmlPreviewTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "html_preview".tr();

  @override
  String get route => Routes.htmlPreview;

  @override
  String get description => "html_preview_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "htmlpreview";

  @override
  String get menuTitle => "html_preview_menu_name".tr();

  @override
  Widget get page => const HtmlPreviewPage();
}
