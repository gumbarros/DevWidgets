import 'package:dev_widgets/domain/helpers/generators/lipsum_generator.dart';
import 'package:dev_widgets/src/models/groups/generators_group.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LipsumGeneratorTool implements Tool {
  @override
  IconData get icon => Icons.text_snippet_rounded;

  @override
  String get homeTitle => "lipsum_generator".tr;

  @override
  String get route => Routes.lipsumGenerator;

  @override
  String get description => "lipsum_generator_description".tr;

  @override
  Group get group => GeneratorsGroup();

  @override
  String get name => "lipsum";

  @override
  String get menuTitle => "lipsum".tr;

  LipsumGenerator get generator => LipsumGenerator();
}
