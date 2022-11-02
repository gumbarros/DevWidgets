import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/text/markdown_preview/markdown_preview_page.dart';
import 'package:dev_widgets/src/impl/text/text_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class MarkdownPreviewTool implements Tool {
  const MarkdownPreviewTool() : super();

  @override
  IconData get icon => Icons.insert_drive_file_sharp;

  @override
  String get fullTitle => "markdown_preview".tr();

  @override
  String get route => Routes.markdownPreview;

  @override
  String get description => "markdown_preview_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "markdown";

  @override
  String get shortTitle => "markdown_preview_short_title".tr();

  @override
  Widget get page => const MarkdownPreviewPage();
}
