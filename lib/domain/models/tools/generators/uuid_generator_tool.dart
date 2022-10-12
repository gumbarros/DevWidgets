import 'package:devtoys/domain/helpers/generators/uuid_generator.dart';
import 'package:devtoys/domain/models/groups/generators_group.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UuidGeneratorTool implements Tool {
  @override
  IconData get icon => Icons.person;

  @override
  String get homeTitle => "uuid_generator".tr;

  @override
  String get route => Routes.uuidGenerator;

  @override
  String get description => "uuid_generator_description".tr;

  @override
  Group get group => GeneratorsGroup();

  @override
  String get commandLineArgName => "uuid";

  @override
  String get menuName => "uuid".tr;

  UuidGenerator get generator => UuidGenerator();
}
