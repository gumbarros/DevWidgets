import 'package:dev_widgets/src/impl/generators/generators_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/generators/lipsum/lipsum_generator_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LipsumGeneratorTool implements Tool {
  const LipsumGeneratorTool() : super();

  @override
  IconData get icon => Icons.text_snippet_rounded;

  @override
  String get fullTitle => "lipsum_generator".tr();

  @override
  String get route => Routes.lipsumGenerator;

  @override
  String get description => "lipsum_generator_description".tr();

  @override
  Group get group => GeneratorsGroup();

  @override
  String get name => "lipsum";

  @override
  String get shortTitle => "lipsum".tr();

  @override
  Widget get page => const LipsumGeneratorPage();
}
