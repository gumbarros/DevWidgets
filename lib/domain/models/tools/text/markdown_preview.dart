import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MarkdownPreviewTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.markdown;

  @override
  String get name => "markdown_preview".tr;

  @override
  String get route => Routes.markdownPreview;

  @override
  String get description => "markdown_preview_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get commandLineArgName => "markdown";
}
