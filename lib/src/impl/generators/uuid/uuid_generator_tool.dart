import 'package:dev_widgets/src/impl/generators/generators_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/generators/uuid/uuid_generator_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UuidGeneratorTool implements Tool {
  const UuidGeneratorTool() : super();

  @override
  IconData get icon => Icons.person;

  @override
  String get fullTitle => "uuid_generator".tr();

  @override
  String get route => Routes.uuidGenerator;

  @override
  String get description => "uuid_generator_description".tr();

  @override
  Group get group => const GeneratorsGroup();

  @override
  String get name => "uuid";

  @override
  String get shortTitle => "uuid".tr();

  @override
  Widget get page => const UuidGeneratorPage();
}
