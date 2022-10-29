import 'package:dev_widgets/src/impl/domain/encoders/base_64_text_encoder.dart';
import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/encoders/encoders_group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class Base64TextEncoderTool implements Tool {
  const Base64TextEncoderTool() : super();

  @override
  IconData get icon => Icons.text_snippet_sharp;

  @override
  String get homeTitle => "base64_text_encoder".tr();

  @override
  String get route => Routes.base64TextEncoder;

  @override
  String get description => "base64_text_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "base64text";

  @override
  String get menuTitle => "base64_text_encoder_menu_name".tr();

  Base64TextEncoder get encoder => Base64TextEncoder();
}
