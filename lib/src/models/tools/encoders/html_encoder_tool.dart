import 'package:dev_widgets/src/impl/domain/encoders/encoder.dart';
import 'package:dev_widgets/src/impl/domain/encoders/html_encoder.dart';
import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/encoders/encoders_group.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../tool.dart';

class HtmlEncoderTool implements Tool {
  const HtmlEncoderTool() : super();

  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "html_encoder".tr();

  @override
  String get route => Routes.htmlEncoder;

  @override
  String get description => "html_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "html";

  @override
  String get menuTitle => "html_encoder_menu_name".tr();

  Encoder get encoder => HtmlEncoder();
}
