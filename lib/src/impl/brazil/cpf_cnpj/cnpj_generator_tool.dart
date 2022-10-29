import 'package:dev_widgets/src/impl/brazil/brazil_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CnpjGeneratorTool implements Tool {
  const CnpjGeneratorTool() : super();

  @override
  IconData get icon => Icons.business;

  @override
  String get homeTitle => "cnpj".tr();

  @override
  String get route => Routes.cnpj;

  @override
  String get description => "cnpj_description".tr();

  @override
  Group get group => BrazilGroup();

  @override
  String get name => "cnpj";

  @override
  String get menuTitle => "cnpj_menu_name".tr();
}
