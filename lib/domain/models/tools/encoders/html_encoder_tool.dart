import 'package:devtoys/domain/helpers/encoders/encoder.dart';
import 'package:devtoys/domain/helpers/encoders/html_encoder.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tool.dart';

class HtmlEncoderTool implements Tool {
  @override
  IconData get icon => Icons.code;

  @override
  String get homeTitle => "html_encoder".tr;

  @override
  String get route => Routes.htmlEncoder;

  @override
  String get description => "html_encoder_description".tr;

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "html";

  @override
  String get menuTitle => "html_encoder_menu_name".tr;

  Encoder get encoder => HtmlEncoder();
}
