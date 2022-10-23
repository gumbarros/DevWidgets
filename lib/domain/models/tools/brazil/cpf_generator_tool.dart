import 'package:dev_widgets/domain/models/groups/brazil_group.dart';
import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CpfTool implements Tool {
  @override
  IconData get icon => Icons.person;

  @override
  String get homeTitle => "cpf".tr;

  @override
  String get route => Routes.cpf;

  @override
  String get description => "cpf_description".tr;

  @override
  Group get group => BrazilGroup();

  @override
  String get name => "cpf";

  @override
  String get menuTitle => "cpf".tr;
}
