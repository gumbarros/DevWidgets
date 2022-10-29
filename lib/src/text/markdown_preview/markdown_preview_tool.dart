import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/text/text_group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class MarkdownPreviewTool implements Tool {
  const MarkdownPreviewTool() : super();

  @override
  IconData get icon => Icons.insert_drive_file_sharp;

  @override
  String get homeTitle => "markdown_preview".tr();

  @override
  String get route => Routes.markdownPreview;

  @override
  String get description => "markdown_preview_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "markdown";

  @override
  String get menuTitle => "markdown_preview_menu_name".tr();
}
