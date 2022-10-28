import 'package:dev_widgets/src/models/groups/brazil_group.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class CpfGeneratorTool implements Tool {
  @override
  IconData get icon => Icons.person;

  @override
  String get homeTitle => "cpf".tr();

  @override
  String get route => Routes.cpf;

  @override
  String get description => "cpf_description".tr();

  @override
  Group get group => BrazilGroup();

  @override
  String get name => "cpf";

  @override
  String get menuTitle => "cpf_menu_name".tr();
}
