import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/text_group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class MarkdownPreviewTool implements Tool {
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
