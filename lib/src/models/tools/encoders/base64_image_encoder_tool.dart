import 'package:dev_widgets/src/impl/domain/encoders/base_64_image_encoder.dart';
import 'package:dev_widgets/src/models/groups/group.dart';
import 'package:dev_widgets/src/models/groups/encoders_group.dart';
import 'package:dev_widgets/src/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class Base64ImageEncoderTool implements Tool {
  const Base64ImageEncoderTool() : super();

  @override
  IconData get icon => Icons.image;

  @override
  String get homeTitle => "base64_image_encoder".tr();

  @override
  String get route => Routes.base64ImageEncoder;

  @override
  String get description => "base64_image_encoder_description".tr();

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "base64image";

  @override
  String get menuTitle => "base64_image_encoder_menu_name".tr();

  Base64ImageEncoder get encoder => Base64ImageEncoder();
}
