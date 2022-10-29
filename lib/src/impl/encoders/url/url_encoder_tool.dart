import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/encoders/encoders_group.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UrlEncoderTool implements Tool {
  const UrlEncoderTool() : super();

  @override
  IconData get icon => Icons.link;

  @override
  String get homeTitle => "url_encoder".tr();

  @override
  String get route => Routes.urlEncoder;

  @override
  String get description => "url_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "url-encode";

  @override
  String get menuTitle => "url_encoder_menu_name".tr();
}
