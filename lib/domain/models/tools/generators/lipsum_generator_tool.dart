import 'package:devtoys/domain/helpers/generators/lipsum_generator.dart';
import 'package:devtoys/domain/models/groups/generators_group.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
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
  String get commandLineArgName => "lipsum";

  @override
  String get menuName => "lipsum".tr;

  LipsumGenerator get generator => LipsumGenerator();
}
