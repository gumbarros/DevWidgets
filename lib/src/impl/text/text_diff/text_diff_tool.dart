import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/text/text_diff/text_diff_page.dart';
import 'package:dev_widgets/src/impl/text/text_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class TextDiffTool implements Tool {
  const TextDiffTool() : super();

  @override
  IconData get icon => Icons.difference;

  @override
  String get fullTitle => "text_diff".tr();

  @override
  String get route => Routes.textDiff;

  @override
  String get description => "text_diff_description".tr();

  @override
  Group get group => const TextGroup();

  @override
  String get name => "diff";

  @override
  String get shortTitle => "text_diff_short_title".tr();

  @override
  Widget get page => const TextDiffPage();
}
