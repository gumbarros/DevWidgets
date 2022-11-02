import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/encoders/base64_text/base64_text_encoder_page.dart';
import 'package:dev_widgets/src/impl/encoders/encoders_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/impl/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Base64TextEncoderTool implements Tool {
  const Base64TextEncoderTool() : super();

  @override
  IconData get icon => Icons.text_snippet_sharp;

  @override
  String get fullTitle => "base64_text_encoder".tr();

  @override
  String get route => Routes.base64TextEncoder;

  @override
  String get description => "base64_text_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "base64text";

  @override
  String get shortTitle => "base64_text_encoder_menu_name".tr();

  @override
  Widget get page => const Base64TextEncoderPage();
}
