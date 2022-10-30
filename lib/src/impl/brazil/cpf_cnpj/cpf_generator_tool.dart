import 'package:dev_widgets/src/impl/brazil/brazil_group.dart';
import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generation_mode.dart';
import 'package:dev_widgets/src/impl/brazil/cpf_cnpj/cpf_cnpj_generator_page.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CpfGeneratorTool implements Tool {
  const CpfGeneratorTool() : super();

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

  @override
  Widget get page => const CpfCnpjGeneratorPage(mode: GenerationMode.cpf);
}
