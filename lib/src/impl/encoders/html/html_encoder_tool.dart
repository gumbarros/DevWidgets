import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/encoders/encoders_group.dart';
import 'package:dev_widgets/src/impl/encoders/html/html_encoder_page.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HtmlEncoderTool implements Tool {
  const HtmlEncoderTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get fullTitle => "html_encoder".tr();

  @override
  String get route => Routes.htmlEncoder;

  @override
  String get description => "html_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "html";

  @override
  String get shortTitle => "html_encoder_menu_name".tr();

  @override
  Widget get page => const HtmlEncoderPage();
}
