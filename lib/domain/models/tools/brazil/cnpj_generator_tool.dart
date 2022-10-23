import 'package:dev_widgets/domain/models/groups/brazil_group.dart';
import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CnpjGeneratorTool implements Tool {
  @override
  IconData get icon => Icons.business;

  @override
  String get homeTitle => "cnpj".tr;

  @override
  String get route => Routes.cnpj;

  @override
  String get description => "cnpj_description".tr;

  @override
  Group get group => BrazilGroup();

  @override
  String get name => "cnpj";

  @override
  String get menuTitle => "cnpj_menu_name".tr;
}
