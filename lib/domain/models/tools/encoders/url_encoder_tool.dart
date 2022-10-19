import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/domain/models/tools/encoders/encoder_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../tool.dart';

class URLEncoderTool extends EncoderTool implements Tool {
  URLEncoderTool(super.encoder);

  @override
  IconData get icon => Icons.link;

  @override
  String get homeTitle => "url_encoder".tr;

  @override
  String get route => Routes.urlEncoder;

  @override
  String get description => "url_encoder_description".tr;

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "url-encode";

  @override
  String get menuTitle => "url_encoder_menu_name".tr;
}
