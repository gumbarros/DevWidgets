import 'package:dev_widgets/domain/helpers/encoders/base_64_image_encoder.dart';
import 'package:dev_widgets/domain/models/groups/group.dart';
import 'package:dev_widgets/domain/models/groups/encoders_group.dart';
import 'package:dev_widgets/domain/models/tools/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Base64ImageEncoderTool implements Tool {
  @override
  IconData get icon => Icons.image;

  @override
  String get homeTitle => "base64_image_encoder".tr;

  @override
  String get route => Routes.base64ImageEncoder;

  @override
  String get description => "base64_image_encoder_description".tr;

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "base64image";

  @override
  String get menuTitle => "base64_image_encoder_menu_name".tr;

  Base64ImageEncoder get encoder => Base64ImageEncoder();
}
