import 'package:dev_widgets/src/impl/domain/encoders/encoder.dart';
import 'package:dev_widgets/src/impl/domain/encoders/url_encoder.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/encoders_group.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import '../tool.dart';

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

  Encoder get encoder => UrlEncoder();
}
